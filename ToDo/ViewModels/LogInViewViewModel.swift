//
//  LogInViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import Foundation
import FirebaseAuth

class LogInViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var error = ""
    
    init () {}
    
    func logIn() {
        guard validateFields() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func validateFields() -> Bool {
        error = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            error = "all fields required"
            return false
        }
        
        guard isValidEmail(email) else {
            error = "invalid email format"
            return false
        }
        
        return true
    }
}
