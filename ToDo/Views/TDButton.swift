//
//  TDButton.swift
//  ToDo
//
//  Created by עזרא רוביו on 08/05/2023.
//

import SwiftUI

struct TDButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding(10)
    }
}

struct TDButton_Previews: PreviewProvider {
    static var previews: some View {
        TDButton(title: "button", background: .blue) {
            
        }
    }
}
