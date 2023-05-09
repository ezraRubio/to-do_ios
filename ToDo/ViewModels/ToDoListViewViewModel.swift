//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestoreSwift
import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var isCreateItemPresented = false
    @Published var ToDos: [ToDoItem] = []
    
    init() {}
}
