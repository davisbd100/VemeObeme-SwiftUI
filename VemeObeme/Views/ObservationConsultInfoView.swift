//
//  ObservationConsultInfoView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran.
//

import SwiftUI

struct ObservationConsultInfoView: View {
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
                    Text("Observación de ausencia de supervision")
                        .font(.custom("Avenir Book", size: 12))
                    
                    Text("Código:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text("REP-01")
                        .font(.custom("Avenir Book", size: 12))
                }
                Divider()
                Group{
                    Text("Fecha de la observación:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text("21-mar-2020")
                        .font(.custom("Avenir Book", size: 12))
                    
                    Text("Hora aproximada de la observación:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text("16:00")
                        .font(.custom("Avenir Book", size: 12))
                    
                    Text("Fecha de observación:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text("22-mar-2020")
                        .font(.custom("Avenir Book", size: 12))
                }
                Divider()
                
                Group{
                    Text("Especialidad:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text("Ginecología")
                        .font(.custom("Avenir Book", size: 12))
                }
                Divider()
                Group{
                    Text("Comentarios:")
                        .font(.custom("Avenir Heavy", size: 12))
                    Text("Observación realizada con el propósito de hacer notar las faltas administrativas en la unidad de ginecología. El día señalado se obligo a mi compañera a realizar un procedimiento altamente peligroso sin supervisión alguna.")
                        .font(.custom("Avenir Book", size: 12))
                }
            }
        }
    }
}

struct ObservationConsultInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ObservationConsultInfoView()
    }
}
