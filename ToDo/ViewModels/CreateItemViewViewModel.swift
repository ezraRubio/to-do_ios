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
        var uid: String = ""
        let currentUser = Auth.auth().currentUser
        if let currentUser = currentUser {uid = currentUser.uid}
        
        guard !uid.isEmpty else {
            errorMessage = "ups! somethign happened. no user logged in"
            showError = true
            return
        }
        
        let newItem = ToDoItem(title: title, dueDate: dueDate, createdAt: Date().timeIntervalSince1970, createdById: uid)
        
        let db = Firestore.firestore()
        
        db.collection("items")
            .addDocument(data: newItem.structAsDictionary())
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
