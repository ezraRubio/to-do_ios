//
//  User.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let createdAt: TimeInterval
}
