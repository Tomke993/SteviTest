//
//  HomeUIView.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 10.3.24..
//

import SwiftUI

struct HomeUIView: View {
    
    var model: HomeViewModel
    
    var body: some View {
        VStack {
            ZStack {
                if let avatarUrl = model.user?.avatar_url {
                    AsyncImage(url: URL(string: avatarUrl))
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                }
                Circle()
                    .strokeBorder(Color.blue,lineWidth: 3)
            }.frame(width: 200, height: 200)
            Text("User:").padding(.top, 16)
            Text(model.user?.name ?? "User Name").font(.system(size: 24))
            if let company = model.user?.company {
                Text("Company:").padding(.top, 16)
                Text(company).font(.system(size: 24))
            }
            Button(action: {
                model.loadRepositories()
            }, label: {
                Text("Show Repositories")
            }).frame(maxWidth: .infinity, maxHeight: 48).background(RoundedRectangle(cornerRadius: 12.0).stroke(Color.blue, lineWidth: 2.0)).padding()
        }
    }
}

#Preview {
    let model = HomeViewModel()
    return HomeUIView(model: model)
}
