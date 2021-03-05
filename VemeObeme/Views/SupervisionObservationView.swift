//
//  SupervisionObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct SupervisionObservationView: View {
    @State var date:Date = Date()
    @State var selectedValue:String = ""
    var values = ["Urgencias"]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Divider()
                Text("General")
                    .font(.custom("Avenir Book", size: 14))
                    .foregroundColor(.green)
                HStack{
                    Rectangle()
                        .fill(Color.yellow)
                        .frame(width: 20, height: 20)
                    Text("Observación de ausencia de supervisión médica")
                        .font(.custom("Avenir Heavy", size: 14))
                        .padding()
                }
                
                Text("Observación hecha el: " + convertOnlyDateToString(date: Date()))
                    .font(.custom("Avenir Book", size: 14))
                    .padding()
                Divider()
                Group{
                    HStack{
                        Image(systemName: "info.circle")
                        Text("Fecha del incidente")
                            .font(.custom("Avenir Book", size: 16))
                            .foregroundColor(.green)
                            .padding()
                    }
                    CustomDatePicker(value: $date, title: "Fecha del incidente", maxDate: date, minDate: date)
                    Divider()
                    HStack{
                        Image(systemName: "info.circle")
                        Text("Hora aproximada del incidente")
                            .font(.custom("Avenir Book", size: 16))
                            .foregroundColor(.green)
                            .padding()
                    }
                    Divider()
                    HStack{
                        Image(systemName: "info.circle")
                        Text("Servicio")
                            .font(.custom("Avenir Book", size: 16))
                            .foregroundColor(.green)
                            .padding()
                    }
                    CustomDropDown(selectedValue: $selectedValue, title: "Efe", values: values)
                }

                
            }
            .padding()
        }
    }
}

struct SupervisionObservationView_Previews: PreviewProvider {
    static var previews: some View {
        SupervisionObservationView()
    }
}
