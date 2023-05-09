//
//  ToDoItemViewViewModel.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import Foundation

class ToDoItemViewViewModel: ObservableObject {
    @Published var title: String = "something"
    @Published var dueDate: Date = Date()
    
    init() {}
}
