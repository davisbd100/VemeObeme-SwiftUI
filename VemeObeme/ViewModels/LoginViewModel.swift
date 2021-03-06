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
    
    func tryLogin(completion: @escaping(Bool) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        UserManagementPetitionManager().tryLogin(username: username, password: password) {
            if ($1 != nil){
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion(false)
            }else{
                do{
                    let user = try JSONDecoder().decode(User.self, from: $0!.data)
                    self.currentUser = user
                }catch let error{
                    debugPrint("Error: \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        self.isError = true
                    }
                    completion(false)
                }
                if (self.currentUser.correo == nil){
                    DispatchQueue.main.async {
                        self.isError = true
                    }
                    completion(false)
                }else if(self.currentUser.jwt != ""){
                    DispatchQueue.main.async {
                        self.isError = false
                    }
                    UserDefaults.standard.setCodableObject(self.currentUser, forKey: "currentUser")
                    UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                    completion(true)
                }else{
                    DispatchQueue.main.async {
                        self.isError = true
                    }
                    completion(false)
                }
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished login process")
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
