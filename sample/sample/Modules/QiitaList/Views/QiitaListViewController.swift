//
//  QiitaListViewController.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

final class QiitaListViewController: UIViewController {
    
    // MARK: Stored Instance Properties
    
    private let articlesTableView: UITableView = {
        let tableView = UITableView()
        tableView.frame = UIScreen.main.bounds
        tableView.register(cellType: QiitaTableViewCell.self)
        return tableView
    }()
    private var presenter: QiitaListPresenterInput!
    private var articles: [Qiita] = []
    
    // MARK: View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        self.presenter.viewDidLoad()
    }
    
    // MARK: Other Internal Methods
    
    func inject(presenter: QiitaListPresenterInput) {
        self.presenter = presenter
    }
    
    // MARK: Other Private Methods
    
    private func configureTableView() {
        self.articlesTableView.delegate = self
        self.articlesTableView.dataSource = self
        self.view.addSubview(articlesTableView)
    }
}

extension QiitaListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return QiitaTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension QiitaListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: QiitaTableViewCell.self, for: indexPath)
        let article = self.articles[indexPath.row]
        cell.setup(title: article.title, isRead: article.isRead, profileImageURLString: article.profile_image_url)
        cell.delegate = self
        return cell
    }
}

extension QiitaListViewController: QiitaTableViewCellProtocol {
    func didTapReadButton(index: Int) {
        // TODO: 既読変更ロジックをPresenterに書く（分岐がなく、バケツリレーが手間なので、このように手を抜くのもあり）
        self.articles[index].isRead.toggle()
        DispatchQueue.main.async {
            self.articlesTableView.reloadData()
        }
    }
}

extension QiitaListViewController: QiitaListPresenterOutput {
    func showArticles(articles: [Qiita]) {
        self.articles = articles
        DispatchQueue.main.async {
            self.articlesTableView.reloadData()
        }
    }
}
