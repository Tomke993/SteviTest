//
//  RepositoriesViewModel.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

import Foundation


class RepositoriesViewModel {
    
    private let apiService = ApiService.shared
    var controller: RepositoriesViewControllerProtocol?
    
    var repositoryList: [RepositoryBean] = []
    
    func loadRepositories() {
        apiService.getRepositories { repositories in
            self.repositoryList = repositories
            self.controller?.initView()
        }
    }
    
    func getCreatedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString) ?? Date()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let newDateString = dateFormatter.string(from: date)
        return newDateString
    }
    
    func goToCommitList(ofRepo repo: String) {
        controller?.goToCommitList(ofRepo: repo)
    }
}
