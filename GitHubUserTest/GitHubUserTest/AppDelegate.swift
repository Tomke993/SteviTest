//
//  AppDelegate.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 9.3.24..
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initNavigationController()
        return true
    }
    
    private func initNavigationController() {
        let navigationController = UINavigationController()
        let homeViewController = HomeViewController(nibName: nil, bundle: nil)
        navigationController.viewControllers = [homeViewController]
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }


}

