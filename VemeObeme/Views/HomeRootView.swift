//
//  HomeRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct HomeRootView: View {
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

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
