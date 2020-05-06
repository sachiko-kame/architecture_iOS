//
//  ViewController.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
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
    
    private let notificationCenter = NotificationCenter()
    private lazy var viewModel = ViewModel(
        notificationCenter: notificationCenter)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(
        self,
        selector: #selector(updateData),
        name: viewModel.changeData,
        object: nil)
        
        configureTableView()
        viewModel.fetchItems()
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
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: TableViewCell.self, for: indexPath)
        
        if let item = self.viewModel.getItem(row: indexPath.row){
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
        self.viewModel.readChange(index: index)
    }
}

extension ViewController {
    @objc func updateData(notification: Notification) {
        tableView.reloadData()
    }
}

