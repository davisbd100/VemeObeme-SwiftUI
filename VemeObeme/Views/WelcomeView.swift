//
//  WelcomeView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct WelcomeView: View {
    @State var name:String = (UserDefaults.standard.getcodableObject(dataType: User.self, key: "currentUser")?.nombres)!
    var body: some View {
        VStack{
            Image("LogoOBEME")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 150, idealWidth: 180, maxWidth: 300, minHeight: 70, idealHeight: 82, maxHeight: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("Bienvenido " + name)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 302, maxWidth: 400, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 31, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Heavy", size: 20))
            Text("¿Desea realizar una observación?")
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 243, maxWidth: 300, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 22, maxHeight: 44, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            ObservationButton(logo: "ic_reporte_positivo", barColor: .green, message: "Observación positiva", destinationView: AnyView(PositiveObservationRootView()))
            ObservationButton(logo: "ic_reporte_supervision", barColor: .yellow, message: "Ausencia de supervisión médica", destinationView: AnyView(SupervisionObservationRootView()))
            ObservationButton(logo: "ic_reporte_trasgresion", barColor: .red, message: "Transgresión de derechos", destinationView: AnyView(TransgressionObservation()))
            Spacer()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
