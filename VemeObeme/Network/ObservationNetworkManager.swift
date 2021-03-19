//
//  ObservationNetworkManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation
class ObservationNetworkManager {
    private var hostname: String = URL.myUrlBase
    private var currentUser = UserDefaults.standard.getcodableObject(dataType: User.self, key: "currentUser")
    
    func addPositiveObservition(positiveObservation: PositiveObservation, completion: @escaping(Response?, Error?) -> ()){
        
        guard let url = URL(string: hostname + "observaciones/positivo/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer " + (currentUser?.jwt)!, forHTTPHeaderField: "Authorization")
        do {
            let jsonData = try JSONEncoder().encode(positiveObservation)
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
                completion(nil, PetitionError.NotAuthorizedError)
            }
        }
        task.resume()
    }
}
