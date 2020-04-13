//
//  Model.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/13.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit
import APIKit

class Model{
    
    init(){
        itemGet()
    }
    
    var items: Array<Qiita> = []{
        didSet {
            notificationCenter.post(name: .init(rawValue: "items"),
                                    object: nil,
                                    userInfo: ["items": items])
        }
    }
    
    let notificationCenter = NotificationCenter()

    func itemGet(){
        Session.send(QiitaListRequest()) { result in
            switch result {
            case .success(let response):
                var qiitas: Array<Qiita> = []
                
                for item in response.qiitaItems {
                    let qiita = Qiita(Item: item)
                    qiitas.append(qiita)
                }
                
                self.items = qiitas
                print("success!")
            
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func readChange(isRead:Bool, index:Int) {
        self.items[index].isRead = isRead
    }
}
