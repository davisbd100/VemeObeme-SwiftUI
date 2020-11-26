//
//  LoginView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isEmailValid: Bool = false
    @State private var isLogin: Bool = false
    @State private var errorMessages: String = "Login"
    
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {

            Image("LogoOBEME")
                .frame(width: 216, height: 98)
            
            Text("Iniciar Sesión")
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 168, maxWidth: 200, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 41, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Heavy", size: 30))
            
            ValidatorField(value: $viewModel.username, placeholder: "Correo", keyType: .emailAddress, borderlineColor: viewModel.isMailValid || viewModel.username.isEmpty ? Color.black : Color.red)

            ValidatorSecureField(value: $viewModel.password, placeholder: "Contraseña")
            Button(action: {
                let dispatch = DispatchGroup()
                isLogin.toggle()
                
                dispatch.enter()
                viewModel.tryLogin(){errorcode in
                    dispatch.leave()
                }
                dispatch.notify(queue: .main){
                    isLogin.toggle()
                }
            }, label: {
                Text("Iniciar Sesion")
                    .foregroundColor(.white)
                    .font(.custom("Avenir Heavy", size: 15))
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            .background(Color.blue)
            .cornerRadius(10.0)
            .alert(isPresented: $isLogin, content: {
                Alert(title: Text(errorMessages), message: Text(errorMessages))
            })
            .alert(isPresented: $isEmailValid, content: {
                Alert(title: Text("Email invalido, revisa que sea correcto y reintenta"))
            })
            
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
}

struct ValidatorField: View {
    @Binding var value: String
    var placeholder: String
    var keyType: UIKeyboardType
    var borderlineColor: Color
    
    var body: some View{
        HStack{
            TextField(placeholder, text: $value)
                .foregroundColor(.green)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.custom("Avenir Book", size: 15)).padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(borderlineColor, lineWidth: 2)
                )
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
        }
    }
}

struct ValidatorSecureField: View {
    @Binding var value: String
    @State var secured: Bool = true
    var placeholder: String
    
    
    var body: some View{
        ZStack {
            if secured{
                SecureField(placeholder, text: $value)
                    .foregroundColor(.green)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.custom("Avenir Book", size: 15)).padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }else{
                TextField(placeholder, text: $value)
                    .foregroundColor(.green)
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .font(.custom("Avenir Book", size: 15)).padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 2)
                    )
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
            EyeButton(value: $secured)
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: .trailing)
            
        }
    }
}

struct EyeButton: View{
    @Binding var value: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                value.toggle()
            }, label: {
                Image(systemName: value ? "eye.fill": "eye.slash.fill")
            })
        }
    }
}

struct Validator: View {
    var message: String
    
    var body: some View{
        HStack{
            Text(message)
                .font(.title)
                .foregroundColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 11")
    }
}
