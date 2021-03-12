//
//  NetworkDataValidation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation
class NetworkDataValidations {
    private var hostname: String = URL.myUrlBase
    func CheckIfEmailExists(email: String, completion: @escaping(Bool) -> ()){
        
        guard let url = URL(string: hostname + "user/checkIfExists/" + email) else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let response = try JSONDecoder().decode(Bool.self, from: sentData)
                    completion(response)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
