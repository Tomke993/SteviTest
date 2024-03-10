//
//  HomeViewModel.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//


class HomeViewModel {
    
    private let apiService = ApiService.shared
    var controller: HomeViewControllerProtocol?
    
    var user: UserBean?
    
    func loadUser() {
        apiService.getProfile { user in
            self.user = user
            self.user?.company = "Stevi"
            self.controller?.initView()
        }
    }
    
    func goToRepositoryList() {
        controller?.goToRepositoryList()
    }
    
}
