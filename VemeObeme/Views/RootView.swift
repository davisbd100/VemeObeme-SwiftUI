//
//  RootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 23/11/20.
//

import SwiftUI

struct RootView: View {
    @State var login = false
    @State var isLoggedIn = (UserDefaults.standard.bool(forKey: "isLoggedIn"))
    var body: some View {
            UserDefaults.standard.setCodableObject(User(correo: "davisbd100@gmail.com", jwt: "token", nombres: "David", apellidos: "Bárcenas Durán", email: "davisbd100@gmail.com", fechaNacimiento: "24&05/99", genero: "Masculino", celular: "2288455625", university: Univesity(pais: "México", nombreUniversidad: "Universidad Veracruzana"), healtUnit: HealthUnit(healthUnitName: "Clínica 11 IMSS")), forKey: "currentUser")
        return Group {
            NavigationView{
                if (isLoggedIn){
                    HomeRootView()
                        .navigationBarHidden(true)
                }
                else if login {
                    LoginView()
                        .navigationBarHidden(true)
                }else{
                    OnboardView(showLogin: $login)
                        .navigationBarHidden(true)
                }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    @State var tryBool = false
    static var previews: some View {
        RootView()
    }
}
