//
//  FaultObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct FaultObservationView: View {
    @StateObject var viewModel: FaultObservationViewModel
    @State var personTypes: [PersonType] = []
    @State var dataIsLoaded = false
    @State var color: Color
    
    @Binding var isLoading: Bool
    @Binding var isFatalError: Bool
    @Binding var loadingTitle: String

    var body: some View {
        Form{
            VStack(alignment: .leading){
                Text("General")
                    .font(.custom("Avenir Book", size: 14))
                    .foregroundColor(.green)
                HStack{
                    Rectangle()
                        .fill(color)
                        .frame(width: 20, height: 20)
                    Text(viewModel.faultType.tipo ?? "Error at retrieving type")
                        .font(.custom("Avenir Heavy", size: 14))
                        .padding()
                }
                Text("Observación hecha el: " + convertOnlyDateToString(date: Date()))
                    .font(.custom("Avenir Book", size: 14))
                    .padding()
            }
            Group{
                HStack{
                    Image(systemName: "info.circle")
                    Text("Fecha del incidente")
                        .font(.custom("Avenir Book", size: 16))
                        .foregroundColor(.green)
                        .padding()
                }
                CustomDatePicker(value: $viewModel.observationDate, title: "Fecha de la observación", maxDate: Date(), minDate: Calendar.current.date(byAdding: .month, value: -12, to: Date())!)
                HStack{
                    Image(systemName: "info.circle")
                    Text("Hora aproximada del incidente")
                        .font(.custom("Avenir Book", size: 16))
                        .foregroundColor(.green)
                        .padding()
                    DatePicker("Hora aproximada de la observación", selection:$viewModel.observationHour, displayedComponents: .hourAndMinute)
                            .background(Color.white)
                            .accentColor(.black)
                            .font(.custom("Avenir Book", size: 14)).padding()
                            .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
                            .addBorder(Color.black, width: 2, cornerRadius: 20)
                }
                HStack{
                    Image(systemName: "info.circle")
                    Text("Persona involucrada")
                        .font(.custom("Avenir Book", size: 16))
                        .foregroundColor(.green)
                        .padding()
                }
                Picker(selection: $viewModel.personType , label: Text("Persona involucrada"), content: {
                    ForEach(personTypes, id: \.self) { value in
                        Text("\(value.personaInvolucrada!)")
                            .font(.custom("Avenir Book", size: 15))
                    }
                })
                .font(.custom("Avenir Book", size: 15)).padding()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color.white)
                .addBorder(Color.black, width: 2, cornerRadius: 20)
                .onAppear(perform: {
                    if (!isLoading && !dataIsLoaded){
                        isLoading.toggle()
                        loadingTitle = "Cargando persona involucrada"
                        let dispatch = DispatchGroup()
                        
                        dispatch.enter()
                        viewModel.getPersonasInvolucradas{ typeList in
                            self.dataIsLoaded = true
                            self.personTypes = typeList
                            isLoading.toggle()
                            loadingTitle = "Cargando"
                            dispatch.leave()
                        }

                        dispatch.notify(queue: .main){
                            isFatalError = viewModel.isError
                        }
                    }
                })
            }
        }
    }
}
