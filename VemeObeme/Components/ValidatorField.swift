//
//  ValidatorField.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct ValidatorField: View {
    @Binding var value: String
    var placeholder: String
    var keyType: UIKeyboardType
    var borderlineColor: Color
    
    var body: some View{
        HStack{
            TextField(placeholder, text: $value)
                .foregroundColor(.green)
                .font(.custom("Avenir Book", size: 15)).padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(borderlineColor, lineWidth: 2)
                )
                .keyboardType(keyType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}


