//
//  ToDoItemView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoItemViewViewModel()
    
    var body: some View {
        HStack {
            Text(viewModel.title)
            Text(viewModel.dueDate.formatted())
        }
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView()
    }
}
