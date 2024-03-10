//
//  ApiService.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 9.3.24..
//

import Alamofire

class ApiService {
    
    private let token = ""
    let username = ""
    
    static let shared = ApiService()
    
    private init() {}
    
    var headers: HTTPHeaders {
        [ //.accept("application/vnd.github+json"),
          .authorization(bearerToken: token)
        ]
    }
    
    func getProfile(complition: @escaping (UserBean) -> ()) {
        let request = AF.request("https://api.github.com/users/" + username, method: .get, headers: headers)
        request.validate()
        request.responseDecodable(of: UserBean.self, completionHandler: { response in
            switch response.result {
            case let .success(user):
                print("Response: \n \(user)")
                complition(user)
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        })
    }
    
    func getRepositories() {
        let request = AF.request("https://api.github.com/users/" + username + "/repos", method: .get, headers: headers)
        request.validate()
        request.responseDecodable(of: [RepositoryBean].self, completionHandler: { response in
            switch response.result {
            case let .success(repositories):
                print("Response: \n \(repositories)")
//                complition(user)
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        })
    }
}
