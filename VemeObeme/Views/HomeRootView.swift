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
                    .navigationBarTitle(Text("Home"))
                    .edgesIgnoringSafeArea([.top, .bottom])
                WelcomeView()
                    .tabItem {
                        Image(systemName: "doc.text.fill")
                        Text("Reportes")
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text("Home"))
                    .edgesIgnoringSafeArea([.top, .bottom])
                
                CheckInfoView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Información")
                    }
                    .navigationBarHidden(true)
                    .navigationBarTitle(Text("Home"))
                    .edgesIgnoringSafeArea([.top, .bottom])
            }
            .frame(alignment: .top)
        }
    }
}

struct HomeRootView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRootView()
    }
}
