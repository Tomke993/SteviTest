//
//  LoginViewModel.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 11.3.24..
//

import Foundation


class LoginViewModel {
    
    private let apiService = ApiService.shared
    var controller: LoginViewControllerProtocol?
    var pollingTimer: Timer?
    
    var authBean: AuthBean?
    
    func getAuthCode(username: String, complition: @escaping () -> ()) {
        apiService.getAuthCode { authBean in
            self.authBean = authBean
            self.apiService.username = username
            self.controller?.openGitHubWebPage()
            self.initPollingTimer()
            complition()
        }
    }
    
    func initPollingTimer() {
        pollingTimer = Timer.scheduledTimer(timeInterval: TimeInterval(authBean?.interval ?? 5), target: self, selector: #selector(getAccessToken), userInfo: nil, repeats: true)
    }
    
    @objc func getAccessToken() {
        apiService.getAccessToken(deviceCode: (authBean?.device_code ?? "")) {
            self.pollingTimer?.invalidate()
            self.controller?.goToHome()
        }
    }
}
