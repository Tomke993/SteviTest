//
//  CommitsViewModel.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//


class CommitsViewModel {
    
    private let apiService = ApiService.shared
    var controller: CommitsViewControllerProtocol?
    
    var commitList: [CommitBean] = []
    
    func loadCommits(forRepo repo: String) {
        apiService.getCommits(forRepo: repo) { commits in
            self.commitList = commits
            self.controller?.initView()
        }
    }
}
