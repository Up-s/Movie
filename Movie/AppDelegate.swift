//
//  AppDelegate.swift
//  Movie
//
//  Created by Kira on 12/12/2018.
//  Copyright © 2018 Kira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let tableVC = UINavigationController(rootViewController: TableViewController())
        let collectionVC = UINavigationController(rootViewController: CollectionViewController())
        
        tableVC.tabBarItem.title = "Table"
        tableVC.tabBarItem.image = UIImage(named: "table")
        collectionVC.tabBarItem.title = "Collection"
        collectionVC.tabBarItem.image = UIImage(named: "collection")
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [tableVC, collectionVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

