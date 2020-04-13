//
//  ViewController.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/13.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myModel: Model? {
        didSet { // ViewとModelとを結合し、Modelの監視を開始する
            registerModel()
        }
    }

    private(set) lazy var myView: View = View()
    
    override func loadView() {
        view = myView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myModel = Model()
    }
    
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }
    
    private func registerModel() {
        //データと連携するとき
        guard let model = myModel else { return }
        
        myView.tableView.delegate = myView
        myView.tableView.dataSource = self
        
        model.notificationCenter.addObserver(forName: .init(rawValue: "items"),
                                             object: nil,
                                             queue: nil,
                                             using: { [unowned self] notification in
                                                self.myView.tableView.reloadData()
        })
    }
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TableViewCell.self, for: indexPath)
        if let item = self.myModel?.items[indexPath.row]{
            cell.set(qiita: item)
            cell.delegate = self
        }else{
            cell.noSet()
        }
        return cell
    }
}

extension ViewController:tableViewCellProtocol{
    func readButtonTap(index: Int, isRead: Bool) {
        self.myModel?.readChange(isRead: isRead, index: index)
    }
}


