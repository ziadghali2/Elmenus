//
//  AppDelegate.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainScreenVC = MainScreenViewController()
        let navigationController = UINavigationController(rootViewController: mainScreenVC)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        return true
    }
    
}

