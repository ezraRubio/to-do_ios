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
    
    func getTodos(uid: String) -> [ToDoItem] {
        let db = Firestore.firestore()
        let itemsCollection = db.collection("users")
                                .document(uid)
                                .collection("items")
        itemsCollection.getDocuments {querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let docData = document.data()
                    let id = docData["id"] as? String ?? ""
                    let title = docData["title"] as? String ?? ""
                    let dueDate = docData["dueDate"] as? TimeInterval ?? Date().timeIntervalSince1970
                    let createdAt = docData["createdAt"] as? TimeInterval ?? Date().timeIntervalSince1970
                    let isDone = docData["isDone"] as? Bool ?? false

                    self.ToDos.append(ToDoItem(id: id, title:title, dueDate: dueDate, createdAt: createdAt, isDone: isDone))
                }
            }
        }
        return ToDos
    }
}
