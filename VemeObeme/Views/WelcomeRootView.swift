//
//  WelcomeRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 21/01/21.
//

import SwiftUI

struct WelcomeRootView: View {
    var body: some View {
        TabView{
            WelcomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
        }
    }
}

struct WelcomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeRootView()
    }
}
