//
//  ObservationNetworkManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation
class ObservationNetworkManager {
    private var hostname: String = URL.myUrlBase
    
    func tryRegister(user: User, completion: @escaping(Response?, Error?) -> ()){
        
        guard let url = URL(string: hostname + "user/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData

        } catch let error {
            debugPrint("Error: \(error.localizedDescription)")
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                debugPrint("Error at making petition")
                completion(nil, error!);
                return
            }
            if (responseData.statusCode == 200){
                completion(Response(data: sentData), nil)
            }else{
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func tryLogin(username: String, password: String, completion: @escaping(Response?, Error?) -> ()){
        
        guard let url = URL(string: hostname + "user/authenticate/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = ["username": username,
                                         "password": password]

        guard let encodedParameters = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            debugPrint("Error at making petition")
            completion(nil, NSError(domain: "parameters_invalid", code: 100, userInfo: [NSLocalizedDescriptionKey: "Failed conversion cause invalid parameters"]))
            return
        }
        request.httpBody = encodedParameters

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                debugPrint("Error at making petition")
                completion(nil, error!);
                return
            }
            if (responseData.statusCode == 200){
                completion(Response(data: sentData), nil)
            }else{
                completion(nil, error)
            }
        }
        task.resume()
    }
}
