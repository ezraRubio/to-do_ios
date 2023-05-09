//
//  CreateItemView.swift
//  ToDo
//
//  Created by עזרא רוביו on 07/05/2023.
//

import SwiftUI

struct CreateItemView: View {
    @StateObject var viewModel = CreateItemViewViewModel()
    @Binding var isCreateItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size:32))
                .bold()
                .padding(20)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TDButton(title: "Save", background: .pink) {
                    if viewModel.isNewItemValid() {
                        viewModel.save()
                        isCreateItemPresented = false
                    } else {
                        viewModel.showError = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showError) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
            }
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView(isCreateItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
