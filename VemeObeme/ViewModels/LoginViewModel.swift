//
//  LoginViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var username = ""
    @Published var password = ""

    @Published var isMailValid = false
    @Published var isPasswordValid = false
    @Published var isError = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var currentUser = User()
    
    
    init() {
        $username
            .receive(on: RunLoop.main)
            .map{
                username in
                return isValidEmail(email: username)
            }.assign(to: \.isMailValid, on: self)
            .store(in: &cancellableSet)
    }
    
    func tryLogin(completion: @escaping(String) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        PetititonManager().tryLogin(username: username, password: password) {
            self.currentUser = $0
            print(self.currentUser)
            if (self.currentUser.correo == nil){
                self.isError = true
                completion("No existe el usuario")
            }else if(self.currentUser.jwt != ""){
                self.isError = false
                completion("Ok")
            }else{
                self.isError = true
                completion("Error no identificado")
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished task")
        }
    }
    
    func checkFields() -> Bool {
        var validation = false
        if (username.isEmpty || password.isEmpty) {
            validation = false
        }else{
            validation = !isValidEmail(email: username)
        }
        return validation
    }
}
