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
                .keyboardType(keyType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
                .addBorder(Color.black, width: 2, cornerRadius: 20)
        }
    }
}


