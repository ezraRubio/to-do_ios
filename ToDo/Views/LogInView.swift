//
//  LogInView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LogInViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "welcome")
                
                Form {
                    if !viewModel.error.isEmpty {
                        Text(viewModel.error)
                            .foregroundColor(.red)
                    }
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TDButton(title:"Log In", background: .blue) {
                        viewModel.logIn()
                    }
                }
                .offset(y:-80)

                VStack{
                    Text("New User?")
                    NavigationLink("Create new account", destination: SignUpView())
                }
                .offset(y:-50)
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
