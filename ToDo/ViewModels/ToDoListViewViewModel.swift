//
//  ToDoListViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var isCreateItemPresented = false
    private let uid: String
    
    init(userId: String) {
        self.uid = userId
    }
    
    func deleteTodo(id: String) {
        let db = Firestore.firestore()

        db.collection("users")
            .document(uid)
            .collection("items")
            .document(id)
            .delete() { err in
                if let err = err {
                    print("Error removing document: \(err)")
                } else {
                    print("Document of id: \(id) successfully removed!")
                }
            }
    }
}
