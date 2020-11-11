//
//  LoginViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published private var currentUser = User()
    
    func tryLogin(email: String, password: String) {
        
    }
}
