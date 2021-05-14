//
//  ObservationConsultInfoView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran.
//

import SwiftUI

struct ObservationConsultInfoView: View {
    @State var observation: GenericObservation
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text("Información")
                    .font(.custom("Avenir Book", size: 14))
                    .foregroundColor(.gray)
                Divider()
                Group{
                    Text("Tipo de observación:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text(observation.tipoObservacion ?? "Observation type not found")
                        .font(.custom("Avenir Book", size: 12))
                    
                    Text("Código:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text(observation.codigo ?? "Observación")
                        .font(.custom("Avenir Book", size: 12))
                }
                Divider()
                Group{
                    Text("Fecha de la observación:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text(formatStringDateForShowing(date: observation.fechaObservacion ?? "2020-05-03T09:19:15.000+0000"))
                        .font(.custom("Avenir Book", size: 12))
                    
                    Text("Hora aproximada de la observación:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text(getHourStringDateForShowing(date: observation.horaObservacion ?? "2020-05-03T09:19:15.000+0000"))
                        .font(.custom("Avenir Book", size: 12))
                    
                    Text("Fecha de registro:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text(formatStringDateForShowing(date: observation.fechaRegistro ?? "2020-05-03T09:19:15.000+0000"))
                        .font(.custom("Avenir Book", size: 12))
                }
                Divider()
                Group{
                    Text("Comentarios:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text(observation.comentarios ?? "Comentarios")
                        .font(.custom("Avenir Book", size: 12))
                }
            }
            .padding()
        }
        .navigationBarTitle(Text(observation.codigo ?? "Observación"))
    }
}

struct ObservationConsultInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ObservationConsultInfoView(observation: GenericObservation())
    }
}
