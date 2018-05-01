//
//  AppDelegate.swift
//  third-hw
//
//  Created by Michal Kroupa on 2.4.18.
//  Copyright © 2018 Michal Kroupa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        return true
    }
}

