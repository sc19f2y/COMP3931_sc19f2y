//
//  AppDelegate.swift
//  Allive
//
//  Created by Fan Yang on 29/04/2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
        let rootvc = ViewController()
        let nav = UINavigationController.init(rootViewController: rootvc)
        window?.rootViewController = nav
        return true
    }

    

}

