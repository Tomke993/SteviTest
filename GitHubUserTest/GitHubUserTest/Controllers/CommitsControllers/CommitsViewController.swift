//
//  CommitsViewController.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

import UIKit
import SwiftUI

protocol CommitsViewControllerProtocol {
    func initView()
}

class CommitsViewController: UIViewController, CommitsViewControllerProtocol {
    
    var commitsModel = CommitsViewModel()
    var repoName: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        commitsModel.controller = self
        commitsModel.loadCommits(forRepo: repoName)
    }
    
    func initView() {
        let commitsView = CommitsUIView(model: commitsModel)
        let hostingController = UIHostingController(rootView: commitsView)
        self.addChild(hostingController)
        hostingController.view.frame = CGRect(origin: .zero, size: CGSize(width: view.frame.width, height: view.frame.height))
        self.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
