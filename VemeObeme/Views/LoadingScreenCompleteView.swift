//
//  LoadingScreenCompleteView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct LoadingScreenCompleteView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack{
            Text("Observación enviada con éxito")
                .font(.custom("Avenir Book", size: 26))
                .padding()
            Text("¡Gracias por tu reporte!")
                .font(.custom("Avenir Book", size: 20))
                .padding()
            Text("Agradecemos mucho tu observación. Nos ayudará a conocer mejor las fortalezas y debilidades del proceso educativo de internos, pasantes y residentes en las unidades médicas.")
                .font(.custom("Avenir Book", size: 18))
                .padding()
            Spacer()
        }
        .padding()
    }
}

struct LoadingScreenCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenCompleteView()
    }
}
