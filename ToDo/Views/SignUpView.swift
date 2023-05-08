//
//  SignUpView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "To Do List", subtitle: "join")
            
            Form {
                if !viewModel.error.isEmpty {
                    Text(viewModel.error)
                        .foregroundColor(.red)
                }
                
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                
                TDButton(title:"Register", background:.green){
                    viewModel.signUp()
                }
            }
            .offset(y:-80)
            
            Spacer()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
