//
//  AuthBean.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 11.3.24..
//


struct AuthBean: Codable {
    var device_code: String
    var user_code: String
    var verification_uri: String?
    var expires_in: Int
    var interval: Int
}
