//
//  CustomDropDown.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//


import SwiftUI

struct CustomDropDown: View {
    @Binding var selectedValue : String
    var values: [String]
    @State var isExpanded = false
    @State var isFocused = false
    
    var body: some View{
        VStack{
            DisclosureGroup("\(selectedValue)", isExpanded: $isExpanded){
                ScrollView {
                    VStack {
                        ForEach(values, id: \.self) { value in
                            Text("\(value)")
                                .frame(maxWidth: .infinity)
                                .font(.custom("Avenir Book", size: 15))
                                .padding(.all)
                                .onTapGesture {
                                    self.selectedValue = value
                                    withAnimation{
                                        self.isExpanded.toggle()
                                    }
                                }
                                .onHover(perform: { hovering in
                                })
                        }
                    }
                }.frame(minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 100, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
            .onTapGesture {
                withAnimation{
                    self.isExpanded.toggle()
                }
            }
            .font(.custom("Avenir Book", size: 15)).padding()
            .background(Color.white)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
        }
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}


