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
        
        db.collection("items").whereField("createdById", isEqualTo: uid).getDocuments() { (querySnapshot, err)  in
            if let err = err {
                print("error from firebase: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    print(data)
//                    let SingleToDo: ToDoItem = try! JSONDecoder().decode(ToDoItem.self, from: jsonData)
                }
            }
        }
        
        return ToDos
    }
}
