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
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
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
