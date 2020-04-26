//
//  QiitaListRouter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol QiitaListWireframe: class {
    var viewController: UIViewController? { get set }
    
    func presentDetails(_ qiita: Qiita)
    
    static func assembleModule() -> UIViewController
}

final class QiitaListRouter: QiitaListWireframe {
    
    var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let viewController = ViewController()
        let presenter = QiitaListPresenter()
        let interactor = QiitaListInteractor()
        let router = QiitaListRouter()
        let navigation = UINavigationController(rootViewController: viewController)
        
        viewController.presenter = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = viewController

        
        return navigation
    }
    
    func presentDetails(_ qiita: Qiita) {
        print("画面遷移")
        let detailsModuleViewController = DetailsRouter.assembleModule(qiita)
        viewController?.navigationController?.pushViewController(detailsModuleViewController, animated: true)
    }
}
