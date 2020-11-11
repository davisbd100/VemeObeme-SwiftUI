//
//  PetititonManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation

class PetititonManager {
    
    func tryLogin(username: String, password: String, completion: @escaping(User) -> ()){
        
        guard let url = URL(string: "https://veme-test.uc.r.appspot.com/obemeapi/v1/user/authenticate") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = ["username": username,
                                         "password": password]

        guard let encodedParameters = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            return
        }
        request.httpBody = encodedParameters
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let user = try JSONDecoder().decode(User.self, from: sentData)
                    debugPrint(user)
                    completion(user)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
