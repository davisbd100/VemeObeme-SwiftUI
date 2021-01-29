//
//  ReviewObservationButton.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 29/01/21.
//

import SwiftUI

struct ReviewObservationButton: View {
    
    @State var title: String
    @State var incidentDate: String
    @State var observationDate: String
    @State var destinationView: AnyView
    var body: some View {
        ZStack(alignment: .leading){
            NavigationLink(
                destination: destinationView,
                label: {
                    Image("ic_magnifying_glass")
                        .resizable()
                        .scaledToFit()
                        .frame(minWidth: 15, idealWidth: 21, maxWidth: 25, minHeight: 15, idealHeight: 21, maxHeight: 25)
                        .padding(.leading, 5)
                    Text(title)
                            .foregroundColor(.black)
                            .font(.custom("Avenir Heavy", size: 12))
                            .padding(.leading)
                    Text("Incidente:\n" + incidentDate)
                        .foregroundColor(.black)
                        .font(.custom("Avenir Heavy", size: 12))
                        .padding(.leading)
                    Text("Observacion:\n" + incidentDate)
                        .foregroundColor(.black)
                        .font(.custom("Avenir Heavy", size: 12))
                        .padding(.leading)

                })
                .frame(minWidth: 320, idealWidth: 336, maxWidth: 370, minHeight: 40, idealHeight: 65, maxHeight: 70, alignment: .leading)
                .background(Color.white)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            Spacer()
        }
    }
}

struct ReviewObservationButton_Previews: PreviewProvider {
    static var previews: some View {
        ReviewObservationButton(title: "OBSERVACIÓN 01", incidentDate: "12/05/19", observationDate: "12/05/19", destinationView: AnyView(PositiveObservationView()))
    }
}
