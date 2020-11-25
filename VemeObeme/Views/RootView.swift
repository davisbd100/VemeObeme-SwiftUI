//
//  RootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 23/11/20.
//

import SwiftUI

struct RootView: View {
    @State var login = false
    
    var body: some View {
        return Group {
            if login {
                LoginView()
            }else{
                OnboardView(showLogin: $login)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
