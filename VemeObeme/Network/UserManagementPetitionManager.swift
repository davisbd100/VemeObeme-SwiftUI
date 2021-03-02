//
//  UserManagementPetitionManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation
class UserManagementPetitionManager {
    private var hostname = "https://veme-test.uc.r.appspot.com/obemeapi/v1/"
    
    
    func tryRegister(user: User, completion: @escaping(User) -> ()){
        
        guard let url = URL(string: hostname + "user/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            let user = try? JSONSerialization.jsonObject(with: jsonData, options: [])
            debugPrint(user as Any)

        } catch let error {
            debugPrint("Error: \(error.localizedDescription)")
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let json = try? JSONSerialization.jsonObject(with: sentData, options: [])
                    debugPrint(json as Any)
                    let user = try JSONDecoder().decode(User.self, from: sentData)
                    completion(user)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                    let user = User()
                    completion(user)
                }
            }else{
                let json = try? JSONSerialization.jsonObject(with: sentData, options: [])
                debugPrint(json as Any)
                let user = User()
                completion(user)
            }
        }
        task.resume()
    }

    
}
