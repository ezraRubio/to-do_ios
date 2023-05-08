//
//  LogInViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import Foundation

class LogInViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    init () {}
}
