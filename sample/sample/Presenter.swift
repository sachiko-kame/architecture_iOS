//
//  Presenter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol PresenterInput {
    var numberOfItems: Int { get }
    func itemGet(row: Int) -> Qiita?
    func itemsGet()
    func readChange(index: Int, isRead: Bool)
}

protocol PresenterOutput: AnyObject {
    func update()
}

class Presenter: PresenterInput{
    
    private(set) var items: [Qiita] = []
    
    private weak var view: PresenterOutput!
    private var model: ModelInput

    init(view: PresenterOutput, model: ModelInput) {
        self.view = view
        self.model = model
    }
 
    var numberOfItems: Int {
        return items.count
    }
    
    func itemGet(row: Int) -> Qiita? {
        guard row < items.count else { return nil }
        return items[row]
    }
    
    func itemsGet() {
        model.fetchUser() { [weak self] result in
            self?.items = result
            DispatchQueue.main.async {
                self?.view.update()
            }
        }
    }
    
    func readChange(index: Int, isRead: Bool) {
        items[index].isRead = isRead
        DispatchQueue.main.async {
            self.view.update()
        }
    }
}
