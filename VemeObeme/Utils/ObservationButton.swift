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
            Rectangle()
                .fill(barColor)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 336, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 65, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Button(action: action, label: {
                    Text(message)
                        .foregroundColor(.black)
                        .font(.custom("Avenir Medium", size: 16))
                        .padding(.leading)

            })
            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 336, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 65, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(Color.gray)
            .padding(.leading, 5.0)
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 40, alignment: .trailing)
        }
    }
}

struct ObservationButton_Previews: PreviewProvider {
    static var previews: some View {
        ObservationButton(logo: "happiness", barColor: .green, message: "Observacion Positiva", action: {})
    }
}
