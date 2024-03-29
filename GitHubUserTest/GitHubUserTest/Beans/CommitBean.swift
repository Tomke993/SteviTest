//
//  CommitBean.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

struct CommitBean: Codable {
    var node_id: String
    var sha: String
    var commit: CommitDetailsBean
}

struct CommitDetailsBean: Codable {
    var message: String
    var comment_count: Int
}
