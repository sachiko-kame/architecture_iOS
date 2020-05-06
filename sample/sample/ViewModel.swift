//
//  ViewModel.swift
//  sample
//
//  Created by 水野祥子 on 2020/05/04.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

final class ViewModel: NSObject {
    let changeData = Notification.Name("changeData")
    
    private(set) var items: [Qiita] = []
    
    private let notificationCenter: NotificationCenter
    private let model: ModelProtocol

    init(notificationCenter: NotificationCenter, model: ModelProtocol = Model()) {
        self.notificationCenter = notificationCenter
        self.model = model
    }
    
    func fetchItems(){
        model.fetchItems(completion: { items in
            self.items = items
            self.notificationCenter.post(name: self.changeData, object: nil)
        })
    }
    
    func readChange(index:Int) {
        let chagedValue = !(items[index].isRead)
        self.items[index].isRead = chagedValue
        notificationCenter.post(name: changeData, object: nil)
    }
    
    func getItem(row: Int) -> Qiita? {
        guard row < items.count else { return nil }
        return items[row]
    }

}
