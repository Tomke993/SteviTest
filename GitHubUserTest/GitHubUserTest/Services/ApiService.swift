//
//  ApiService.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 9.3.24..
//

import Alamofire

class ApiService {
    
    private let token = "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"
    private let username = "Tomke993"
    
    static let shared = ApiService()
    
    private init() {}
    
    var headers: HTTPHeaders {
        [ //.accept("application/vnd.github+json"),
          .authorization(bearerToken: token)
        ]
    }
    
    func getProfile() {
        let request = AF.request("https://api.github.com/users/" + username, method: .get, headers: headers)
        request.validate()
        request.responseDecodable(of: UserBean.self, completionHandler: { response in
            switch response.result {
            case let .success(user):
                print("Response: \n \(user)")
            case let .failure(error):
                print("ERROR \n\(error)")
            }
        })
    }
}
