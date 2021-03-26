//
//  CheckInfoView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct CheckInfoView: View {
    @StateObject var viewModel = CheckInfoViewModel()
    @Binding var isLoggedIn: Bool
    @State var stays: [Stay] = []
    var body: some View {
        VStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text("Datos personales")
                        .font(.custom("Avenir Medium", size: 16))
                        .padding()
                    Group{
                        Text("Correo electrónico: " + viewModel.currentUser.correo!)
                            .font(.custom("Avenir Book", size: 14))
                        Text("Fecha de nacimiento: " + formatStringDateForShowing(date: (viewModel.currentUser.estudiante?.fechaNacimiento)!))
                            .font(.custom("Avenir Book", size: 14))
                        Text("Genero: " + (viewModel.currentUser.estudiante?.genero!)!)
                            .font(.custom("Avenir Book", size: 14))
                    }
                    Divider()
                    Text("Datos de la universidad")
                        .font(.custom("Avenir Medium", size: 16))
                        .padding()
                    Group{
                        Text("País: " + (viewModel.currentUser.estudiante?.estancias?.last?.institucionSalud?.pais?.nombre)!)
                            .font(.custom("Avenir Book", size: 14))
                        Text("Universidad: " + ((viewModel.currentUser.estudiante?.universidad?.nombre)!))
                            .font(.custom("Avenir Book", size: 14))
                    }
                    Divider()
                    Text("Datos de la unidad de salud (actual)")
                        .font(.custom("Avenir Medium", size: 16))
                        .padding()
                    Group{
                        Text("Periodo actual: " + getMonthStringDateForShowing(date: (viewModel.currentUser.estudiante?.estancias?.last?.fechaInicio)!) + " - " + getMonthStringDateForShowing(date: (viewModel.currentUser.estudiante?.estancias?.last?.fechaFin)!))
                            .font(.custom("Avenir Book", size: 14))
                        Text("Unidad de salud: " + (viewModel.currentUser.estudiante?.estancias?.last?.institucionSalud?.nombre)!)
                            .font(.custom("Avenir Book", size: 14))
                        Text("Tipo de estancia: " + (viewModel.currentUser.estudiante?.estancias?.last?.tipoEstancia?.nombre)!)
                            .font(.custom("Avenir Book", size: 14))
                        Text("Especialidad: " + (viewModel.currentUser.estudiante?.estancias?.last?.especialidad?.nombre ?? "No existe"))
                            .font(.custom("Avenir Book", size: 14))
                    }
                    Divider()
                    Group{
                        Text("Periodos anteriores")
                        PeriodHelper(stays: (viewModel.currentUser.estudiante?.estancias)!)
                    }
                }
                .padding()
            }
            Button(action: {
                viewModel.Logout()
                isLoggedIn = false
            }, label: {
                Text("Cerrar sesión")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color.red)
            .cornerRadius(10.0)
        }
    }
}
