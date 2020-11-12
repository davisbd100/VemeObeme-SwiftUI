//
//  LoginView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isEmailValid: Bool = false
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                
            Image("LogoOBEME")
                .frame(width: 216, height: 98)
            
            Text("Iniciar Sesión")
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 168, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 41, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Heavy", size: 30))
            
            TextField("Correo", text:$username)
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Book", size: 15)).padding()
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("Contraseña", text:$password)
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Book", size: 15)).padding()
            
            Button(action: {
                if (checkFields()){
                    viewModel.tryLogin(username: username, password: password)
                }else if(!isEmailValid){
                    //Mensaje de email invalido
                }else{
                    //mensaje de campos vacios
                }
            }, label: {
                Text("Iniciar Sesion")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color.blue)
            .cornerRadius(10.0)
            .alert(isPresented: self.$isEmailValid) {
                Alert(title: Text("Hello"))
            }
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Registrate")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color.green)
            .cornerRadius(10.0)
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("¿Que es el Obeme?")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color.yellow)
            .cornerRadius(10.0)
            
        })
        .padding(.trailing)
        .padding(.leading)
        .padding(.bottom)
    }
    func checkFields() -> Bool {
        var validation = false
        if (username.isEmpty || password.isEmpty) {
            validation = false
        }else{
            isEmailValid = isValidEmail(email: username)
            validation = isEmailValid
        }
        return validation
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 11")
    }
}
