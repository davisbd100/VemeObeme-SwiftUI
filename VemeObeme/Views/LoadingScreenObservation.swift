//
//  LoadingScreenObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI
import Lottie

struct LoadingScreenObservation: View {
    var body: some View {
        VStack{
            Text("Enviando observación…")
                .font(.custom("Avenir Book", size: 22))
            Spacer()
            LottieView(filename: "electro", loopMode: .loop)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 212, maxWidth: 250, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 212, maxHeight: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding()
            Text("Esta observación no tendrá una respuesta por parte de la aplicación. Su finalidad es solamente de carácter informativo. ")
                .font(.custom("Avenir Book", size: 16))
            Spacer()
        }
    }
}

struct LoadingScreenObservation_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenObservation()
    }
}
