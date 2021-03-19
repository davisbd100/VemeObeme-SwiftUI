//
//  PositiveObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct PositiveObservationView: View {
    @StateObject var viewmodel: PositiveObservationViewModel
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Divider()
                Text("General")
                    .font(.custom("Avenir Book", size: 14))
                    .foregroundColor(.green)
                HStack{
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: 20, height: 20)
                    Text("Observación positiva")
                        .font(.custom("Avenir Heavy", size: 14))
                        .padding()
                }
                Text("Observación hecha el: " + convertOnlyDateToString(date: Date()))
                    .font(.custom("Avenir Book", size: 14))
                    .padding()
                    .multilineTextAlignment(.center)
                Divider()
                HStack{
                    Image(systemName: "info.circle")
                    Text("Aspectos a evaluar")
                        .font(.custom("Avenir Book", size: 16))
                        .foregroundColor(.green)
                        .padding()
                }
                    .padding()
                Group{
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.ensenianza, title: "Enseñanza")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.evaluacionesAprendizaje, title: "Evaluaciones del aprendizaje")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.retroalimentacion, title: "Retroalimentación recibida")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.cumplimientoPrograma, title: "Cumplimiento del programa académico")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.instalaciones, title: "Instalaciones")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.tratoDocente, title: "Trato del docente")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.tratoAdscritos, title: "Trato de los adscritos")
                    SimpleCheckbox(isChecked: $viewmodel.newPositiveObservation.tratoTrabajadores, title: "Trato de los trabajadores")
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct PositiveObservationView_Previews: PreviewProvider {
    static var previews: some View {
        PositiveObservationView(viewmodel: PositiveObservationViewModel())
    }
}
