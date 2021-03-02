//
//  HomeRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct HomeRootView: View {
    var body: some View {
        NavigationView{
            TabView{
                WelcomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Inicio")
                    }
                    .navigationBarHidden(true)
                ObservationConsultView()
                    .tabItem {
                        Image(systemName: "doc.text.fill")
                        Text("Observaciones")
                    }
                    .navigationBarHidden(true)
                    .navigationTitle("Observaciones")
                
                CheckInfoView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Información")
                    }
                    .navigationBarHidden(true)
                    .navigationTitle("Información general")
            }
        }
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
