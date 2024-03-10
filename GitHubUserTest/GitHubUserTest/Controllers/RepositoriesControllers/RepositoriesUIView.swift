//
//  RepositoriesUIView.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

import SwiftUI

struct RepositoriesUIView: View {
    
    var model: RepositoriesViewModel
    
    var body: some View {
        VStack {
            Text("List of Repository").font(.system(size: 24))
            List(model.repositoryList, id: \.self) { repository in
                Section {
                    Button(action: {
                        model.loadCommits(forRepo: repository.name)
                    }, label: {
                        VStack{
                            HStack {
                                Text(repository.name).font(.system(size: 20)).foregroundStyle(.white)
                            }.frame(maxWidth: .infinity).frame(height: 50).background(RoundedRectangle(cornerRadius: 12.0).stroke(Color.blue, lineWidth: 2.0).fill(.blue))
                            HStack {
                                Text("Created: \(model.getCreatedDate(dateString:  repository.created_at))").foregroundStyle(.black)
                                Spacer()
                                Text("Files: \(repository.size)").foregroundStyle(.black)
                            }.padding()
                        }.frame(height: 100).background(RoundedRectangle(cornerRadius: 12.0).stroke(Color.blue, lineWidth: 2.0))
                    })
                }.listRowSeparator(.hidden)
            }.listStyle(.plain).listRowSpacing(10)
        }
    }
}

#Preview {
    let repositories = [RepositoryBean(id: 769678125, name: "SteviTest", visibility: "public", size: 12, forks_count: 0, created_at: "2024-03-09T18:43:08Z"), RepositoryBean(id: 769678125, name: "Test", visibility: "public", size: 12, forks_count: 0, created_at: "2024-03-09T18:43:08Z")]
    let model = RepositoriesViewModel()
    model.repositoryList = repositories
    return RepositoriesUIView(model: model)
}
