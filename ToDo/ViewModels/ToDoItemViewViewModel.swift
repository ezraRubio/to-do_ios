//
//  ToDoItemViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestore
import Foundation

class ToDoItemViewViewModel: ObservableObject {
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func formatDate(_ timeInterval: TimeInterval) -> String {
        return Date(timeIntervalSince1970: timeInterval).formatted(date: .abbreviated, time: .shortened)
    }
    
    func toggleIsDone(id: String, isDone: Bool) {
        let db = Firestore.firestore()
        print(id)
        db.collection("users")
            .document(userId)
            .collection("items")
            .document(id)
            .setData(["isDone": !isDone], merge: true) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document of id \(id) successfully updated!")
                }
            }
    }
}
