//
//  LoginViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation

class LoginViewModel: ObservableObject {
    private var currentUser = User()
    
    func tryLogin(username: String, password: String) {
        PetititonManager().tryLogin(username: username, password: password) {
            self.currentUser = $0
        }
    }
}
