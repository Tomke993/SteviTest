//
//  ApiService.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 9.3.24..
//

import Alamofire

class ApiService {
    
    var token = ""
    var username = ""
    
    static let shared = ApiService()
    
    private init() {}
    
    var headers: HTTPHeaders {
        [.authorization(bearerToken: token)]
    }
    
    func getProfile(complition: @escaping (UserBean) -> ()) {
        let request = AF.request("https://api.github.com/users/" + username, method: .get, headers: headers)
        request.validate()
        request.responseDecodable(of: UserBean.self, completionHandler: { response in
            switch response.result {
            case let .success(user):
                complition(user)
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        })
    }
    
    func getRepositories(complition: @escaping ([RepositoryBean]) -> ()) {
        let request = AF.request("https://api.github.com/users/" + username + "/repos", method: .get, headers: headers)
        request.validate()
        request.responseDecodable(of: [RepositoryBean].self, completionHandler: { response in
            switch response.result {
            case let .success(repositories):
                complition(repositories)
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        })
    }
    
    func getCommits(forRepo repo: String, complition: @escaping ([CommitBean]) -> ()) {
        let request = AF.request("https://api.github.com/repos/" + username + "/\(repo)/commits", method: .get, headers: headers)
        request.validate()
        request.responseDecodable(of: [CommitBean].self, completionHandler: { response in
            switch response.result {
            case let .success(commits):
                complition(commits)
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        })
    }
    
    func getAuthCode(complition: @escaping (AuthBean) -> ()) {
        let clientId = "4993dd894c1b78521445"
        let request = AF.request("https://github.com/login/device/code", method: .post, parameters: ["client_id" : clientId], encoder: JSONParameterEncoder.default)
        request.validate()
        request.response { response in
            switch response.result {
            case let .success(data):
                let dataString = String(data: data!, encoding: .utf8)
                let params = dataString?.split(separator: "&")
                let deviceCode = String(params?[0].replacing("device_code=", with: "") ?? "")
                let expires = Int(params?[1].replacing("expires_in=", with: "") ?? "0") ?? 0
                let interval = Int(params?[2].replacing("interval=", with: "") ?? "0") ?? 0
                let userCode = String(params?[3].replacing("user_code=", with: "") ?? "")
                let authBean = AuthBean(device_code: deviceCode, user_code: userCode, expires_in: expires, interval: interval)
                print("authBean: \n\(authBean)")
                complition(authBean)
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        }
    }
    
    func getAccessToken(deviceCode: String, complition: @escaping () -> ()) {
        let clientId = "4993dd894c1b78521445"
        let grantType = "urn:ietf:params:oauth:grant-type:device_code"
        let parameters = ["device_code" : deviceCode, "client_id" : clientId, "grant_type" : grantType]
        let request = AF.request("https://github.com/login/oauth/access_token", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
        request.validate()
        request.response { response in
            switch response.result {
            case let .success(data):
                let dataString = String(data: data!, encoding: .utf8)
                if let resultString = dataString, !resultString.contains("error=") {
                    let params = dataString?.split(separator: "&")
                    let accessToken = String(params?[0].replacing("access_token=", with: "") ?? "")
                    self.token = accessToken
                    print("Access Token: \(accessToken)")
                    complition()
                }
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        }
    }
}
