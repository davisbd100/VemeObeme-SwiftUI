//
//  RootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 23/11/20.
//

import SwiftUI

struct RootView: View {
    @State var login = false
    @State var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
    var body: some View {
        return Group {
            NavigationView{
                if (isLoggedIn){
                    HomeRootView(isLoggedIn: $isLoggedIn)
                        .navigationBarHidden(true)
                }
                else if login {
                    LoginView(isLoggedIn: $isLoggedIn)
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
