//
//  WelcomeView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct WelcomeView: View {
    @State var name:String = "Unknown user"
    var body: some View {
        VStack{
            Image("LogoOBEME")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 82)
            Text("Bienvenido " + name)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 302, maxWidth: 400, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 31, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Heavy", size: 20))
            Text("¿Desea realizar una observación?")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 243, maxWidth: 300, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 22, maxHeight: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
