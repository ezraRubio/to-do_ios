//
//  ToDoItemView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoItemViewViewModel()
    private var todo: ToDoItem
    
    init(todo: ToDoItem) {
        self.todo = todo
    }
    
    var body: some View {
        HStack {
            Text(todo.title)
            Text(viewModel.formatDate(todo.dueDate))
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        let todo = ToDoItem(id: UUID().uuidString, title:"todo", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: false)
        ToDoItemView(todo: todo)
    }
}
