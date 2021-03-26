//
//  SupervisionObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct SupervisionObservationView: View {
    @StateObject var viewModel: SupervisionObservationViewModel
    @State var serviceAreas: [ServiceArea] = []
    @State var dataIsLoaded = false
    
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
                        .fill(Color.yellow)
                        .frame(width: 20, height: 20)
                    Text("Observación de ausencia de supervisión médica")
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
                CustomDatePicker(value: $viewModel.observationDate, title: "Fecha del incidente", maxDate: Date(), minDate: Calendar.current.date(byAdding: .month, value: -12, to: Date())!)
                HStack{
                    Image(systemName: "info.circle")
                    Text("Hora aproximada del incidente")
                        .font(.custom("Avenir Book", size: 16))
                        .foregroundColor(.green)
                        .padding()
                    DatePicker("Hora del incidente", selection:$viewModel.observationHour, displayedComponents: .hourAndMinute)
                            .background(Color.white)
                            .accentColor(.black)
                            .font(.custom("Avenir Book", size: 14)).padding()
                            .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
                            .addBorder(Color.black, width: 2, cornerRadius: 20)
                }
                HStack{
                    Image(systemName: "info.circle")
                    Text("Servicio")
                        .font(.custom("Avenir Book", size: 16))
                        .foregroundColor(.green)
                        .padding()
                }
                Picker(selection: $viewModel.serviceArea , label: Text("Area de servicio"), content: {
                    ForEach(serviceAreas, id: \.self) { value in
                        Text("\(value.nombre!)")
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
                        loadingTitle = "Cargando areas de servicio"
                        let dispatch = DispatchGroup()
                        
                        dispatch.enter()
                        viewModel.getServiceArea{ serviceArea in
                            self.dataIsLoaded = true
                            self.serviceAreas = serviceArea
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
