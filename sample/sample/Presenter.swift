//
//  Presenter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/17.
//  Copyright © 2020 sachiko. All rights reserved.
//

import Foundation

protocol PresenterInput {
    var itemCount: Int { get }
    func getItem(row: Int) -> Qiita?
    func fetchItems()
    func readChange(index: Int)
}

protocol PresenterOutput: AnyObject {
    func update()
}

final class Presenter: PresenterInput{
    
    private(set) var items: [Qiita] = []
    
    private weak var view: PresenterOutput!
    private var model: ModelInput

    init(view: PresenterOutput, model: ModelInput) {
        self.view = view
        self.model = model
    }
 
    var itemCount: Int {
        return items.count
    }
    
    func getItem(row: Int) -> Qiita? {
        guard row < items.count else { return nil }
        return items[row]
    }
    
    func fetchItems() {
        model.fetchItems() { [weak self] result in
            self?.items = result
            self?.view.update()
        }
    }
    
    func readChange(index: Int) {
        let chagedValue = !(items[index].isRead)
        items[index].isRead = chagedValue
        self.view.update()
    }
}
