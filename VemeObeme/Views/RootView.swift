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
        UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
        UserDefaults.standard.setCodableObject(User(correo: "davisbd100@gmail.com", jwt: "token", nombres: "David", apellidos: "Bárcenas Durán", fechaNacimiento: "24&05/99", genero: "Masculino", university: University(pais: Country(nombre: "México"), nombreUniversidad: "Universidad Veracruzana"), healtInstitution: HealthInstitution(healthInstitutionName: "Clínica 11 IMSS")), forKey: "currentUser")
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
