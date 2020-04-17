//
//  ViewController.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView = UITableView()
    
    private var presenter: PresenterInput!
    func inject(presenter: PresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.frame = UIScreen.main.bounds
        self.view.addSubview(tableView)
        tableView.register(cellType: TableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        self.presenter.itemsGet()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCell.height
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TableViewCell.self, for: indexPath)
        
        if let item = self.presenter.itemGet(row: indexPath.row){
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
        presenter.readChange(index: index, isRead: isRead)
    }
}

extension ViewController: PresenterOutput {
    func update() {
        tableView.reloadData()
    }
}



