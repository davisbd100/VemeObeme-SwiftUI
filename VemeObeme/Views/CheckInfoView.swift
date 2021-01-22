//
//  CheckInfoView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 22/01/21.
//

import SwiftUI

struct CheckInfoView: View {
    @StateObject var viewModel = CheckInfoViewModel()
    var body: some View {
        VStack{
        ScrollView{
            VStack(alignment: .leading){
                Text("Datos personales")
                    .font(.custom("Avenir Medium", size: 16))
                    .padding()
                Group{
                    Text("Nombres: " + viewModel.currentUser.nombres!)
                        .font(.custom("Avenir Book", size: 14))
                    Text("Apellidos: " + viewModel.currentUser.apellidos!)
                        .font(.custom("Avenir Book", size: 14))
                    Text("Correo electrónico: " + viewModel.currentUser.email!)
                        .font(.custom("Avenir Book", size: 14))
                    Text("Fecha de nacimiento: " + viewModel.currentUser.fechaNacimiento!)
                        .font(.custom("Avenir Book", size: 14))
                    Text("Genero: " + viewModel.currentUser.genero!)
                        .font(.custom("Avenir Book", size: 14))
                    Text("Celular: " + viewModel.currentUser.celular!)
                        .font(.custom("Avenir Book", size: 14))
                }
                Divider()
                Text("Datos de la universidad")
                    .font(.custom("Avenir Medium", size: 16))
                    .padding()
                Group{
                    Text("País: " + (viewModel.currentUser.university?.pais)!)
                        .font(.custom("Avenir Book", size: 14))
                    Text("Universidad: " + (viewModel.currentUser.university?.nombreUniversidad)!)
                        .font(.custom("Avenir Book", size: 14))
                }
                Divider()
                Text("Datos de la unidad de salud (actual)")
                    .font(.custom("Avenir Medium", size: 16))
                    .padding()
                Group{
                    Text("Periodo actual: ")
                        .font(.custom("Avenir Book", size: 14))
                    Text("Unidad de salud: ")
                        .font(.custom("Avenir Book", size: 14))
                    Text("Tipo de estancia: ")
                        .font(.custom("Avenir Book", size: 14))
                    Text("Especialidad: ")
                        .font(.custom("Avenir Book", size: 14))
                }
                Divider()
                Text("Periodos anteriores")
                    .font(.custom("Avenir Medium", size: 16))
                    .padding()
            }
            .padding()
        }
            Button(action: {
                viewModel.Logout()
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

struct CheckInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInfoView()
    }
}
