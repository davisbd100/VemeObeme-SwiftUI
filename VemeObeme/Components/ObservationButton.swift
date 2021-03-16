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
                .frame(minWidth: 320, idealWidth: 336, maxWidth: 350, minHeight: 40, idealHeight: 65, maxHeight: 70)
                .frame(minWidth: 320, idealWidth: 336, maxWidth: 350, minHeight: 40, idealHeight: 65, maxHeight: 70)
                .background(Color.white)
                .padding(.leading, 5.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Spacer()
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 30, idealWidth: 40, maxWidth: 80, minHeight: 40, idealHeight: 65, maxHeight: 70, alignment: .leading)
        }
    }
}

