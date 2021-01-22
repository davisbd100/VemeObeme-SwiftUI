//
//  PositiveObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct PositiveObservationView: View {
    @State var Ensenanza:Bool = false
    @State var EvaluacionesDelAprendizaje:Bool = false
    @State var RetroalimentacionRecibida:Bool = false
    @State var CumplimientoDelPrograma:Bool = false
    @State var Instalaciones:Bool = false
    @State var TratoDelDocente:Bool = false
    @State var TratoDeLosAdscritos:Bool = false
    @State var TratoDeLosTrabajadores:Bool = false
    
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
                Text("Observación hecha el: " + DateFormatter().string(from: Date()))
                    .font(.custom("Avenir Book", size: 14))
                    .padding()
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
                    SimpleCheckbox(isChecked: $Ensenanza, title: "Enseñanza")
                    SimpleCheckbox(isChecked: $EvaluacionesDelAprendizaje, title: "Evaluaciones del aprendizaje")
                    SimpleCheckbox(isChecked: $RetroalimentacionRecibida, title: "Retroalimentación recibida")
                    SimpleCheckbox(isChecked: $CumplimientoDelPrograma, title: "Cumplimiento del programa académico")
                    SimpleCheckbox(isChecked: $Instalaciones, title: "Instalaciones")
                    SimpleCheckbox(isChecked: $TratoDelDocente, title: "Trato del docente")
                    SimpleCheckbox(isChecked: $TratoDeLosAdscritos, title: "Trato de los adscritos")
                    SimpleCheckbox(isChecked: $TratoDeLosTrabajadores, title: "Trato de los trabajadores")
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct PositiveObservationView_Previews: PreviewProvider {
    static var previews: some View {
        PositiveObservationView()
    }
}
