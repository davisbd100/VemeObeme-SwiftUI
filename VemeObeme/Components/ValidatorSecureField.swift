//
//  ValidatorSecureField.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct ValidatorSecureField: View {
    @Binding var value: String
    @State var secured: Bool = true
    var placeholder: String
    
    
    var body: some View{
        ZStack {
            if secured{
                SecureField(placeholder, text: $value)
                    .foregroundColor(.green)
                    .font(.custom("Avenir Book", size: 15)).padding()
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
                    .addBorder(Color.black, width: 2, cornerRadius: 20)
            }else{
                TextField(placeholder, text: $value)
                    .foregroundColor(.green)
                    .font(.custom("Avenir Book", size: 15)).padding()
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
                    .addBorder(Color.black, width: 2, cornerRadius: 20)
            }
            HStack{
                EyeButton(value: $secured)
                    .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60, alignment: .trailing)
            }
            
        }
    }
}

struct EyeButton: View{
    @Binding var value: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                value.toggle()
            }, label: {
                Image(systemName: value ? "eye.fill": "eye.slash.fill")
            })
        }
    }
}
