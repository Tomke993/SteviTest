//
//  HomeViewController.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 9.3.24..
//

import UIKit
import SwiftUI

protocol HomeViewControllerProtocol {
    func initView()
    func goToRepositoryList()
}

class HomeViewController: UIViewController, HomeViewControllerProtocol {
    
    let homeModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeModel.controller = self
        homeModel.loadUser()
    }
    
    func initView() {
        let homeView = HomeUIView(model: homeModel)
        let hostingController = UIHostingController(rootView: homeView)
        self.addChild(hostingController)
        hostingController.view.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height))
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
    
    func goToRepositoryList() {
        let repositoriesController = RepositoriesViewController()
        navigationController?.pushViewController(repositoriesController, animated: true)
    }
}
