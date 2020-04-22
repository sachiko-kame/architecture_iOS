//
//  QiitaListModel.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
//  Copyright © 2020 sachiko. All rights reserved.
//

import APIKit // TODO: 単体テストが書きづらいため、ModelでAPIライブラリをインポートしないようにする

protocol QiitaListModelInput {
    func fetchArticles(completion: @escaping ([Qiita]) -> Void)
}

final class QiitaListModel {
}

extension QiitaListModel: QiitaListModelInput {
    func fetchArticles(completion: @escaping ([Qiita]) -> Void) {
        Session.send(QiitaListRequest()) { result in
            switch result {
            case .success(let response):
                var items: [Qiita] = []
                for item in response.qiitaItems {
                    let qiita = Qiita(Item: item)
                    items.append(qiita)
                }
                completion(items)
            case .failure(let error):
                print(error.localizedDescription) // TODO: エラーハンドリングする
            }
        }
    }
}
