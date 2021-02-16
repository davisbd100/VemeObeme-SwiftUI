//
//  GetPublicInfoManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 16/02/21.
//

import Foundation

class GetPublicInfoManager {
    private var hostname = "https://veme-test.uc.r.appspot.com/obemeapi/v1/"
    
    func getCountry(completion: @escaping([Country]) -> ()){
        
        guard let url = URL(string: hostname + "paises/") else {
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
                    let countries = try JSONDecoder().decode([Country].self, from: sentData)
                    completion(countries)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
}
