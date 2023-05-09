//
//  ToDoItem.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import Foundation

struct ToDoItem: Codable {
    let title: String
    let dueDate: Date
    let createdAt: TimeInterval
    let createdById: String
}
