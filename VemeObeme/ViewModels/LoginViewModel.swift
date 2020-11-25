//
//  LoginViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    private var currentUser = User()
    
    func tryLogin(username: String, password: String, completion: @escaping(User) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        PetititonManager().tryLogin(username: username, password: password) {
            self.currentUser = $0
            print(self.currentUser)
            completion(self.currentUser)
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished task")
        }
    }
}
