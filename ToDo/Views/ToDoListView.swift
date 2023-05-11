//
//  ToDoListView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var todos: [ToDoItem]
    private let uid: String
    
    init(uid: String) {
        self.uid = uid
        self._todos = FirestoreQuery(
            collectionPath: "users/\(uid)/items"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: uid)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(todos) { todo in
                    ToDoItemView(todo: todo, uid: uid)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.deleteTodo(id: todo.id)
                            }
                            .tint(.red)
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
