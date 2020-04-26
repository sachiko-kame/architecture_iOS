//
//  QiitaListPresenter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import Foundation

protocol QiitaListPresentation: class {
    var view: QiitaListView? { get set }
    var interactor: QiitaListUseCase! { get set }
    var router: QiitaListWireframe! { get set }
    var itemCount: Int { get }
    
    func didSelect(_ qiita: Qiita)
    func getItem(row: Int) -> Qiita?
    func fetch()
    func readChange(index: Int)
}

final class QiitaListPresenter: QiitaListPresentation {
    
    var items: [Qiita] = [] {
        didSet {
            view?.show()
        }
    }
    
    var view: QiitaListView?
    
    var interactor: QiitaListUseCase!
    
    var router: QiitaListWireframe!
    
    var itemCount: Int{
        return items.count
    }

    func didSelect(_ qiita: Qiita) {
        router.presentDetails(qiita)
    }
    
    func getItem(row: Int) -> Qiita? {
        guard row < items.count else { return nil }
        return items[row]
    }
    
    func fetch() {
        interactor.fetch()
    }
    
    func readChange(index: Int) {
        let chagedValue = !(items[index].isRead)
        items[index].isRead = chagedValue
    }
    
}

extension  QiitaListPresenter: QiitaListInteractorOutput {
    func fetched(_ qiita: [Qiita]) {
        self.items = qiita
    }
}
