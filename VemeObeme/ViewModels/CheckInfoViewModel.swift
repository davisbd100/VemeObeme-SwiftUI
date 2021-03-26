//
//  CheckInfoViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation

class CheckInfoViewModel: ObservableObject {
    @Published var currentUser:User = UserDefaults.standard.getcodableObject(dataType: User.self, key: "currentUser")!
    
    init() {
        debugPrint(currentUser)
    }
    
    func Logout(){
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
        let emptyUser = User()
        UserDefaults.standard.setCodableObject(emptyUser, forKey: "currentUser")
    }
}
