//
//  ToDoListView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    @FirestoreQuery var todos: [ToDoItem]
    
    init(uid: String) {
        self._todos = FirestoreQuery(
            collectionPath: "users/\(uid)/items"
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(todos) { todo in
                    ToDoItemView(todo: todo)
                        .swipeActions {
                            Button {
                                viewModel.deleteTodo(id: todo.id)
                            } label: {
                                Text("Delete")
                                    .background(Color(.red))
                            }
                        }
                }
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
        ToDoListView(uid: "uDfu2XSLRtd2Y4tkFHRJaEw2jjB3")
    }
}
