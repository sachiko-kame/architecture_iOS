//
//  Model.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit
import APIKit

protocol ModelInput {
    func fetchUser(completion: @escaping ([Qiita]) -> ())
}

class Model: ModelInput {
    
    func fetchUser(completion: @escaping ([Qiita]) -> ()) {
        Session.send(QiitaListRequest()) { result in
            switch result {
            case .success(let response):
                var items: Array<Qiita> = []
                
                for item in response.qiitaItems {
                    let qiita = Qiita(Item: item)
                    items.append(qiita)
                }
                completion(items)
                print("success!")
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
