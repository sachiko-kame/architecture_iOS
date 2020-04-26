//
//  RootRouter.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/27.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

protocol RootWireframe: class {
    func presentArticlesScreen(in window: UIWindow)
}

class RootRouter: RootWireframe {
    
    func presentArticlesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = QiitaListRouter.assembleModule()
    }
}
