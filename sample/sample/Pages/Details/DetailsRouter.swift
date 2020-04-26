//
//  DetailsRouter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol DetailsWireframe: class {
    static func assembleModule(_ qiita: Qiita) -> UIViewController
}

final class DetailsRouter: DetailsWireframe {
    
    static func assembleModule(_ qiita: Qiita) -> UIViewController {
        let view = DetailsViewController()
        let presenter = DetailsPresenter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.item = qiita
        
        return view
    }
}
