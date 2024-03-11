//
//  LoginUIView.swift
//  GitHubUserTest
//
//  Created by Stefan Tomic on 11.3.24..
//

import SwiftUI
import WebKit

struct LoginUIView: View {
    
    var model: LoginViewModel
    @State var showWebView = false
    @State var username = ""
    
    var body: some View {
        if !showWebView {
            VStack {
                Text("Login will open Git Hub page in browser. After entering username and password you can back to the app to find User Code")
                TextField(text: $username, label: {
                    HStack {
                        Text("Username").padding(.horizontal, 10)
                    }.padding(.horizontal)
                }).frame(maxWidth: .infinity, maxHeight: 48).textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    model.getAuthCode(username: username) {
                        showWebView = true
                    }
                }, label: {
                    Text("Login")
                }).frame(maxWidth: .infinity, maxHeight: 48).background(RoundedRectangle(cornerRadius: 12.0).stroke(Color.blue, lineWidth: 2.0)).disabled(username == "")
                Text("When you finish login process on Git Hub return to the app")
            }.padding()
        } else {
            VStack {
                Text("User Code:").font(.system(size: 24))
                Text(model.authBean?.user_code ?? "").font(.system(size: 36))
            }
        }
    }
}

#Preview {
    let model = LoginViewModel()
    return LoginUIView(model: model)
}
