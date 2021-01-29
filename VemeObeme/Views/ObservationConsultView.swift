//
//  ObservationConsultView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct ObservationConsultView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Observaciones")
                .font(.custom("Avenir Book", size: 14))
                .foregroundColor(.gray)
            Divider()
            ReviewObservationButton(title: "OBSERVACIÓN 01", incidentDate: "12/05/19", observationDate: "12/05/19", destinationView: AnyView(ObservationConsultInfoView()))
            Spacer()
        }
    }
}

struct ObservationConsultView_Previews: PreviewProvider {
    static var previews: some View {
        ObservationConsultView()
    }
}
