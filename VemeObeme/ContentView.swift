//
//  ContentView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var password: String = ""
    var body: some View {
        VStack{
            Image("")
                .frame(width: 216, height: 98)
            Text("Iniciar Sesión")
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 168, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 41, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Heavy", size: 30))
            SecureField("Contraseña", text:$password)
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Book", size: 15))
            TextField("Contraseña", text:$password)
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Book", size: 15))
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
