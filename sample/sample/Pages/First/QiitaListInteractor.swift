//
//  QiitaListInteractor.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import APIKit

protocol QiitaListInteractorOutput: class {
    func fetched(_ qiita: [Qiita])
}

protocol QiitaListUseCase: class {
    var output: QiitaListInteractorOutput! { get set }
    func fetch()
}

final class QiitaListInteractor: QiitaListUseCase{
    
    var output: QiitaListInteractorOutput!
    
    func fetch() {
        Session.send(QiitaListRequest()) { result in
            switch result {
            case .success(let response):
                var items: Array<Qiita> = []
                
                for item in response.qiitaItems {
                    let qiita = Qiita(Item: item)
                    items.append(qiita)
                }
                self.output.fetched(items)
                print("success!")
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
