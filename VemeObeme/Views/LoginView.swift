//
//  LoginView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isLogin: Bool = false
    @State private var codeMessages: String = "Login"
    @State var isErrorPresented: Bool = false
    @State var isShowingRegister: Bool = false
    
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
                Image("LogoOBEME")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 130)
                
                
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
                    viewModel.tryLogin(){code in
                        codeMessages = code
                        dispatch.leave()
                    }
                    dispatch.notify(queue: .main){
                        self.isErrorPresented = viewModel.isError
                        isLogin.toggle()
                    }
                }, label: {
                    Text("Iniciar Sesion")
                        .foregroundColor(.white)
                        .font(.custom("Avenir Heavy", size: 15))
                        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                })
                .background((!viewModel.isMailValid || !viewModel.isPasswordValid) ? Color.gray: Color.blue)
                .cornerRadius(10.0)
                .alert(isPresented: $isErrorPresented, content: {
                    Alert(title: Text("Error"), message: Text(codeMessages), dismissButton: .default(Text("Cerrar"), action: {
                        isErrorPresented = false
                    }))
                }).disabled(!viewModel.isMailValid || !viewModel.isPasswordValid)
                
                NavigationLink(
                    destination: RegisterView(),
                    isActive: $isShowingRegister,
                    label: {
                        Text("Registrate")
                            .foregroundColor(.white)
                            .font(.custom("Avenir Heavy", size: 15))
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 344, maxWidth: 370, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 53, maxHeight: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    })
                    .background(Color.green)
                    .cornerRadius(10.0)
                Spacer()
                NavigationLink(
                    destination: AboutObeme()
                        .navigationBarTitle("¿Qué es el OBEME?", displayMode: .inline),
                    label: {
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
            if isLogin{
                CustomLoadingView(title: "Iniciando Sesión")
            }
        })
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewDevice("iPhone 11")
    }
}

