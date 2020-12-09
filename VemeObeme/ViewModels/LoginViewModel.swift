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
        $password
            .receive(on: RunLoop.main)
            .map{
                password in
                return isValidPasword(pass: password)
            }.assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellableSet)
    }
    
    func tryLogin(completion: @escaping(String) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        PetititonManager().tryLogin(username: username, password: password) {
            self.currentUser = $0
            if (self.currentUser.correo == nil){
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion("No existe el usuario: " + self.username)
            }else if(self.currentUser.jwt != ""){
                DispatchQueue.main.async {
                    self.isError = false
                }
                completion("Ok")
            }else{
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion("Error no identificado")
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Task")
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
