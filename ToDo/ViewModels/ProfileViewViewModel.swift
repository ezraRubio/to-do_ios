//
//  ProfileViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init(userId: String) {
        self.getUser(userId)
    }
    
    private func getUser(_ userId: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .getDocument { [weak self] documentSnapshot, error in
                guard let data = documentSnapshot?.data(), error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        name: data["name"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        createdAt: data["createdAt"] as? TimeInterval ?? 0
                    )
                }
            }
    }
    
    func formatDate(_ timeInterval: TimeInterval) -> String {
        return Date(timeIntervalSince1970: timeInterval).formatted(date: .abbreviated, time: .shortened)
    }
    
    func logOut() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
