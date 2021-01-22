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
    @State var action: ()->Void
    var body: some View {
        ZStack(alignment: .leading){

            Button(action: action, label: {
                    Text(message)
                        .foregroundColor(.black)
                        .font(.custom("Avenir Medium", size: 16))
                        .padding(.leading)
                        .multilineTextAlignment(.leading)

            })
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 336, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 65, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.white)
            .padding(.leading, 5.0)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 40, maxWidth: 80, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 65, maxHeight: 60, alignment: .leading)
        }
    }
}

struct ObservationButton_Previews: PreviewProvider {
    static var previews: some View {
        ObservationButton(logo: "ic_reporte_trasgresion", barColor: .green, message: "Observacion Positiva", action: {})
    }
}
