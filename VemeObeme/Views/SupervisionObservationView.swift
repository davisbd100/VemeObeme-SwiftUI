//
//  SupervisionObservationView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct SupervisionObservationView: View {
    @StateObject var viewModel = SupervisionObservationViewModel()
    @State var date:Date = Date()
    @State var selectedValue:String = ""
    @State var isServiceSelected = false
    @State var serviceAreas: [ServiceArea] = []
    
    @State var isLoading: Bool = false
    @State var isFatalError: Bool = false
    @State var loadingTitle: String = "NotTitle"
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
                        DatePicker("Hora del incidente", selection:$date, displayedComponents: .hourAndMinute)
                                .background(Color.white)
                                .accentColor(.black)
                                .font(.custom("Avenir Book", size: 14)).padding()
                                .frame(idealWidth: 344, maxWidth: 370, idealHeight: 53, maxHeight: 60)
                                .addBorder(Color.black, width: 2, cornerRadius: 20)
                    }
                    Divider()
                    HStack{
                        Image(systemName: "info.circle")
                        Text("Servicio")
                            .font(.custom("Avenir Book", size: 16))
                            .foregroundColor(.green)
                            .padding()
                    }
                    Picker(selection: $viewModel.newSupervisionObservation.areaServicio, label: Text("Areá de servicio"), content: {
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
                        isLoading.toggle()
                        loadingTitle = "Cargando paises"
                        let dispatch = DispatchGroup()
                        
                        dispatch.enter()
                        viewModel.getServiceArea{ serviceArea in
                            self.serviceAreas = serviceArea
                            isLoading.toggle()
                            loadingTitle = "Cargando"
                            dispatch.leave()
                        }

                        dispatch.notify(queue: .main){
                            isFatalError = viewModel.isError
                        }
                    })
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
