//
//  View.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/13.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

class View: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.register(cellType: TableViewCell.self)
        setSubviews()
        setLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    private func setSubviews() {
        addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.frame = UIScreen.main.bounds
    }
}

extension View:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
