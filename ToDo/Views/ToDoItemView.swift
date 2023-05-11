//
//  ToDoItemView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel: ToDoItemViewViewModel
    private var todo: ToDoItem
    
    init(todo: ToDoItem, uid: String) {
        self.todo = todo
        self._viewModel = StateObject(
            wrappedValue: ToDoItemViewViewModel(userId: uid)
        )
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(todo.title)
                    .font(.body)
                Text(viewModel.formatDate(todo.dueDate))
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(id: todo.id, isDone: todo.isDone)
            } label: {
                Image(systemName: todo.isDone ? "checkmark.circle" : "circle")
            }
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        let todo = ToDoItem(id: UUID().uuidString, title:"todo", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isDone: true)
        ToDoItemView(todo: todo, uid: "123")
    }
}
