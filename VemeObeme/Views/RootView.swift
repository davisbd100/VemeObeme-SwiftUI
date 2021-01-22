//
//  RootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 23/11/20.
//

import SwiftUI

struct RootView: View {
    @State var login = false
    @State var isLoggedIn = true
    var body: some View {
        return Group {
            NavigationView{
                if (isLoggedIn){
                    HomeRootView()
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text("Home View"))
                        .edgesIgnoringSafeArea([.top, .bottom])
                }
                else if login {
                    LoginView()
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text("Login"))
                        .edgesIgnoringSafeArea([.top, .bottom])
                }else{
                    OnboardView(showLogin: $login)
                        .navigationBarHidden(true)
                        .navigationBarTitle(Text("Onboard"))
                        .edgesIgnoringSafeArea([.top, .bottom])
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
