//
//  CommitBean.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

struct CommitBean: Codable, Hashable {
    var sha: String
    var commit: CommitDetailsBean
}

struct CommitDetailsBean: Codable, Hashable {
    var message: String
    var comment_count: Int
}
