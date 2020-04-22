//
//  AppDelegate.swift
//  sample
//
//  Created by 水野祥子 on 2020/04/16.
//  Copyright © 2020 sachiko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let viewController = UIStoryboard(name: "QiitaList", bundle: nil).instantiateInitialViewController() as! QiitaListViewController
        let model = QiitaListModel()
        let presenter = QiitaListPresenter(view: viewController, model: model)
        viewController.inject(presenter: presenter)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
        
        return true
    }
}

