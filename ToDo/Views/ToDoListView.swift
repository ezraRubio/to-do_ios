//
//  ToDoListView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userId: String
    
    init(uid: String) {
        self.userId = uid
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.isCreateItemPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.isCreateItemPresented) {
                CreateItemView(isCreateItemPresented: $viewModel.isCreateItemPresented)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(uid: "")
    }
}
