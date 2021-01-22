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
            
            WelcomeView()
                .tabItem {
                    Image(systemName: "doc.text.fill")
                    Text("Reportes")
                }
            
            WelcomeView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Información")
                }
        }
        .frame(alignment: .top)
    }
}

struct WelcomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeRootView()
    }
}
