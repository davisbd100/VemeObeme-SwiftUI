//
//  CustomDropDown.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//


import SwiftUI

struct CustomDropDown: View {
    @Binding var selectedValue : String
    var title: String
    var values: [String]
    
    var body: some View{
        VStack{
            Picker(selection: $selectedValue, label: Text(title), content: {
                ForEach(values, id: \.self) { value in
                    Text("\(value)")
                        .font(.custom("Avenir Book", size: 15))
                }
            })
            .font(.custom("Avenir Book", size: 15)).padding()
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
        }
    }
}


