//
//  Model.swift
//  sample
//
//  Created by 水野祥子 on 2020/05/04.
//  Copyright © 2020 sachiko. All rights reserved.
//

import APIKit

protocol ModelProtocol {
    func fetchItems(completion: @escaping ([Qiita]) -> ())
}

final class Model: ModelProtocol {
    
    func fetchItems(completion: @escaping ([Qiita]) -> ()){
        Session.send(QiitaListRequest()) { result in
            switch result {
            case .success(let response):
                var items: Array<Qiita> = []
                
                for item in response.qiitaItems {
                    let qiita = Qiita(Item: item)
                    items.append(qiita)
                }
                completion(items)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
