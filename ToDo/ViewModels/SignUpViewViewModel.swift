//
//  SignUpViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation


class SignUpViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init() {}
    
    func signUp() {
        guard validateFields() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.addUserToDb(uid: userId)
        }
    }
    
    private func validateFields() -> Bool {
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
                !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "all fields required"
            return false
        }
        
        guard isValidEmail(email) else {
            error = "invalid email format"
            return false
        }
        
        guard password.count >= 6 else {
            error = "password should be at least 6 characters"
            return false
        }
        
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func addUserToDb(uid: String) {
        let newUser = User(id:uid, name:name, email:email, createdAt: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .setData(newUser.structAsDictionary())
    }
}
