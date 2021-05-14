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
    }
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
extension UINavigationController {
    // Remove back button text
    open override func viewWillLayoutSubviews() {
        navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationBar.prefersLargeTitles = false
    }
}
