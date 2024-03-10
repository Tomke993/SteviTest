//
//  RepositoriesViewController.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

import UIKit
import SwiftUI

protocol RepositoriesViewControllerProtocol {
    func initView()
}

class RepositoriesViewController: UIViewController, RepositoriesViewControllerProtocol {
    
    var repositoriesModel = RepositoriesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        repositoriesModel.controller = self
        repositoriesModel.loadRepositories()
    }
    
    func initView() {
        let repositoriesView = RepositoriesUIView(model: repositoriesModel)
        let hostingController = UIHostingController(rootView: repositoriesView)
        self.addChild(hostingController)
        hostingController.view.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height))
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }

}
