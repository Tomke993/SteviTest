//
//  UserBean.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 9.3.24..
//


struct UserBean: Codable {
    var id: Int
//    var login: String
    var email: String?
    var name: String?
    var company: String?
    var avatar_url: String
    var repos_url: String
}
