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
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }else{
                TextField(placeholder, text: $value)
                    .foregroundColor(.green)
                    .font(.custom("Avenir Book", size: 15)).padding()
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            HStack{
                EyeButton(value: $secured)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: .trailing)
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
