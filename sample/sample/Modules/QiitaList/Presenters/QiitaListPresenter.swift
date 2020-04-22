//
//  QiitaListPresenter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
//  Copyright © 2020 sachiko. All rights reserved.
//

protocol QiitaListPresenterInput {
    func viewDidLoad()
}

protocol QiitaListPresenterOutput: AnyObject {
    func showArticles(articles: [Qiita])
}

final class QiitaListPresenter {
    
    // MARK: Stored Instance Properties
    
    private unowned let view: QiitaListPresenterOutput
    private let model: QiitaListModelInput
    
    // MARK: Initializers
    
    init(view: QiitaListPresenterOutput, model: QiitaListModelInput) {
        self.view = view
        self.model = model
    }
}

extension QiitaListPresenter: QiitaListPresenterInput {
    func viewDidLoad() {
        self.model.fetchArticles() { articles in
            self.view.showArticles(articles: articles)
        }
    }
}
