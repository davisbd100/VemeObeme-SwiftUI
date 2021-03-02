//
//  HomeRootView.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import SwiftUI

struct HomeRootView: View {
    
    @Binding var isLoggedIn: Bool
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
                
                CheckInfoView(isLoggedIn: $isLoggedIn)
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
