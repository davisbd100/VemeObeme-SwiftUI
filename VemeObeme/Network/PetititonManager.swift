//
//  PetititonManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation

class PetititonManager {
    
    func tryLogin(completion: @escaping(User) -> ()){
        
        guard let url = URL(string: "https://reqres.in/api/users/2") else {
            fatalError("URL Unreacheble")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            
            if (responseData.statusCode == 200){
                do {
                    let user = try JSONDecoder().decode(User.self, from: sentData)
                    debugPrint(user)
                    completion(user)
                } catch let error {
                    debugPrint(error.localizedDescription)
                }
            }
        }.resume()
    }
}
