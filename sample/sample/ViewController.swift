//
//  ViewController.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = UIScreen.main.bounds
        tableView.register(cellType: TableViewCell.self)
        return tableView
    }()
    
    private var presenter: PresenterInput!
    func inject(presenter: PresenterInput) {
        self.presenter = presenter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.presenter.fetchItems()
    }
    
    private func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.view.addSubview(tableView)
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
        return presenter.itemCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TableViewCell.self, for: indexPath)
        
        if let item = self.presenter.getItem(row: indexPath.row){
            cell.set(qiita: item)
            item.isRead == true ? cell.setRead() : cell.setUnread()
            cell.delegate = self
        }else{
            cell.noSet()
        }
        return cell
    }
}

extension ViewController:tableViewCellProtocol{
    func readButtonTap(index: Int) {
        presenter.readChange(index: index)
    }
}

extension ViewController: PresenterOutput {
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}



