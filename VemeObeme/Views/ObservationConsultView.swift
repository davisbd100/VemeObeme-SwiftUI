//
//  ObservationConsultView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct ObservationConsultView: View {
    @StateObject var viewModel: ObservationConsultViewModel = ObservationConsultViewModel()
    @State var observationList: [GenericObservation] = []
    var body: some View {
        VStack(alignment: .leading){
            Text("Observaciones")
                .font(.custom("Avenir Book", size: 14))
                .foregroundColor(.gray)
            Divider()
            VStack{
                ForEach(observationList, id: \.self){ value in
                    ReviewObservationButton(title: value.codigo ?? "Observación", incidentDate: formatStringDateForShowingShort(date: value.fechaObservacion ?? "2020-05-03T09:19:15.000+0000"), observationDate: formatStringDateForShowingShort(date: value.fechaRegistro ?? "2020-05-03T09:19:15.000+0000"), destinationView: AnyView(ObservationConsultInfoView(observation: value)))
                        .padding(.leading)
                        .padding(.trailing)
                }
            }.padding()
            Spacer()
        }
        .onAppear(perform: {
            let dispatch = DispatchGroup()
            
            dispatch.enter()
            viewModel.GetObservationList(){result in
               observationList = result
            }
            dispatch.notify(queue: .main){
                
            }
        })
    }
}

struct ObservationConsultView_Previews: PreviewProvider {
    static var previews: some View {
        ObservationConsultView()
    }
}
