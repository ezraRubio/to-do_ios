//
//  ToDoItem.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import Foundation

struct ToDoItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    let isDone: Bool
}
