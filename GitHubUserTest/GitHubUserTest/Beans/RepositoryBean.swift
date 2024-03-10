//
//  RepositoryBean.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//


struct RepositoryBean: Codable {
    var id: Int
    var name: String
    var visibility: String
    var size: Int
    var forks_count: Int
}
