//
//  RegisterView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 09/12/20.
//

import SwiftUI

struct RegisterView: View {
    @State private var gender: String = ""
    
    var body: some View {
        VStack{
            customTextBox(value: $gender,placeholder: "Hola2", keyType: .URL, borderlineColor: .black)
            customDropDown(values: ["hola1","Hola2","hola1","hola1","hola1","hola1","hola1","hola1","hola1","hola1","hola1","hola1","hola1"], borderlineColor: .black)
        }
    }
}



struct customTextBox: View {
    @Binding var value: String
    var placeholder: String
    var keyType: UIKeyboardType
    var borderlineColor: Color
    
    var body: some View{
        HStack{
            TextField(placeholder, text: $value)
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Book", size: 15)).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(borderlineColor, lineWidth: 2)
                )
                .keyboardType(keyType)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .multilineTextAlignment(.trailing)
        }
    }
}
struct customDropDown: View {
    var values: [String]
    var borderlineColor: Color
    @State var isExpanded = false
    @State var selectedValue = ""
    
    var body: some View{
        HStack{
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
                        }
                    }
                }.frame(height: 150)
            }
            .onTapGesture {
                withAnimation{
                    self.isExpanded.toggle()
                }
            }
            .font(.custom("Avenir Book", size: 15)).padding()
            .background(Color.white)
            .addBorder(Color.black, width: 2, cornerRadius: 20)
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
extension View {
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
             .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
