//
//  ProfileView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewViewModel
    
    init(uid: String) {
        self._viewModel = StateObject(wrappedValue: ProfileViewViewModel(userId: uid))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profileView(user: user)
                } else {
                    Text("Loading user...")
                }
                
            }
            .navigationTitle("Profile")
        }
    }
    
    @ViewBuilder
    func profileView(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member since: ")
                    .bold()
                Text(viewModel.formatDate(user.createdAt))
            }
            .padding()
        }
        .padding()
        
        TDButton(title: "Log Out", background: .red) {
            viewModel.logOut()
        }
        .frame(width: 250, height: 50)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(uid: "uH3fU1VP6FTPPu3jzfxQ51R7Wxz2")
    }
}
