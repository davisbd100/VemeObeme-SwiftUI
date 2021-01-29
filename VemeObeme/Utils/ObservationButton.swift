//
//  ObservationButton.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct ObservationButton: View {
    @State var logo: String
    @State var barColor: Color
    @State var message: String
    @State var destinationView: AnyView
    var body: some View {
        ZStack(alignment: .leading){
            NavigationLink(
                destination: destinationView,
                label: {
                        Text(message)
                            .foregroundColor(.black)
                            .font(.custom("Avenir Medium", size: 16))
                            .padding(.leading)
                            .multilineTextAlignment(.leading)

                })
                .frame(minWidth: 320, idealWidth: 336, maxWidth: 370, minHeight: 40, idealHeight: 65, maxHeight: 60)
                .background(Color.white)
                .padding(.leading, 5.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Spacer()
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 30, idealWidth: 40, maxWidth: 80, minHeight: 40, idealHeight: 65, maxHeight: 65, alignment: .leading)
        }
    }
}

struct ObservationButton_Previews: PreviewProvider {
    static var previews: some View {
        ObservationButton(logo: "ic_reporte_trasgresion", barColor: .green, message: "Observacion Positiva", destinationView: AnyView(PositiveObservationView()))
    }
}
