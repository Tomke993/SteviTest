//
//  CommitsUIView.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

import SwiftUI

struct CommitsUIView: View {
    
    var model: CommitsViewModel
    
    var body: some View {
        VStack {
            Text("List of Commits").font(.system(size: 24))
            List(model.commitList, id: \.self) { commitItem in
                VStack{
                    HStack {
                        Text("Commit: \(commitItem.sha)").font(.system(size: 20)).foregroundStyle(.white).padding()
                    }.frame(maxWidth: .infinity).frame(height: 50).background(.orange)
                    HStack {
                        Text(commitItem.commit.message).foregroundStyle(.black)
                    }.padding()
                }.frame(height: 100).background(RoundedRectangle(cornerRadius: 12.0).stroke(Color.orange, lineWidth: 2.0)).clipShape(RoundedRectangle(cornerRadius: 12.0)).listRowSeparator(.hidden)
            }.listStyle(.plain).listRowSpacing(10)
        }
    }
}

#Preview {
    let commits = [CommitBean(sha: "49c9265509ce3ad509910094f0ad3cb75dbd4e7f", commit: CommitDetailsBean(message: "Get commits request added", comment_count: 0)), CommitBean(sha: "4d6c8204ac06a3b4dd4cb442310734eddf2f1c1a", commit: CommitDetailsBean(message: "Repositories controller, model and view created", comment_count: 0)), CommitBean( sha: "c5c23c688580ef13e76f3db9ad62d05f41e29aea", commit: CommitDetailsBean(message: "Home controller created", comment_count: 0))]
    let model = CommitsViewModel()
    model.commitList = commits
    return CommitsUIView(model: model)
}
