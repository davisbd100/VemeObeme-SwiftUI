//
//  VemeObemeApp.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import SwiftUI

@main
struct VemeObemeApp: App {
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().barTintColor = UIColor.blue
        UINavigationBar.appearance().tintColor = UIColor.white
        
    }
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
