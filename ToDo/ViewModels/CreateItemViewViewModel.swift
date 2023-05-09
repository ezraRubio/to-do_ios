//
//  CreateItemViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class CreateItemViewViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showError = false
    @Published var errorMessage = ""
    
    init() {}
    
    func save() {
        guard isNewItemValid() else {
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            errorMessage = "ups! somethign happened. no user logged in"
            showError = true
            return
        }
        
        let newItem = ToDoItem(id: UUID().uuidString,
                               title: title,
                               dueDate: dueDate.timeIntervalSince1970,
                               createdAt: Date().timeIntervalSince1970,
                               isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("items")
            .document(newItem.id)
            .setData(newItem.structAsDictionary())
    }
    
    func isNewItemValid() -> Bool {
        errorMessage = ""
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Title cannot be empty."
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-60) else {
            errorMessage = "Due date cannot be in the past."
            return false
        }
        
        return true
    }
}
