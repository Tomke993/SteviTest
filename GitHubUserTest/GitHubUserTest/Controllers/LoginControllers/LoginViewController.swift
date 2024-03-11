//
//  LoginViewController.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 11.3.24..
//

import UIKit
import WebKit
import SwiftUI

protocol LoginViewControllerProtocol {
    func openGitHubWebPage()
    func goToHome() 
}

class LoginViewController: UIViewController, LoginViewControllerProtocol {
    
    var loginModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        loginModel.controller = self
        initView()
    }
    
    func initView() {
        let loginView = LoginUIView(model: loginModel)
        let hostingController = UIHostingController(rootView: loginView)
        self.addChild(hostingController)
        hostingController.view.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height))
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    func openGitHubWebPage() {
        if let url = URL(string: "https://github.com/login/device"), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    func goToHome() {
        let homeController = HomeViewController()
        navigationController?.setViewControllers([homeController], animated: true)
    }
}
