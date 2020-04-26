//
//  DetailsPresenter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import Foundation

protocol DetailsPresentation: class {
    var view: DetailsView? { get set }
    func viewDidLoad()
}

final class DetailsPresenter: DetailsPresentation {
    var view: DetailsView?
    var item: Qiita!
    
    func viewDidLoad() {
        view?.show(item)
    }
}
