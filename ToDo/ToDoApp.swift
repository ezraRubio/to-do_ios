//
//  ToDoApp.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
