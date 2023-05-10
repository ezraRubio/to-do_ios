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
    
    func formatDate(_ timeInterval: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy 'at' HH:mm"
        return formatter.string(from: date)
    }
}
