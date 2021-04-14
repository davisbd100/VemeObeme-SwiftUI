//
//  ObservationConsultViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation

class ObservationConsultViewModel: ObservableObject {
    @Published var currentUser:User = UserDefaults.standard.getcodableObject(dataType: User.self, key: "currentUser")!
    
    func GetObservationList(completion: @escaping([GenericObservation]) -> ()) {
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        
        ObservationNetworkManager().getMyObservationList() {
            
            debugPrint($0 as Any)
            debugPrint($1 as Any)
            if ($1 != nil){
                completion([])
            }else{
                do {
                    let observationList = try JSONDecoder().decode([GenericObservation].self, from: $0!.data)
                    completion(observationList)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                    completion([])
                }
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished register process")
        }
    }
    
    func Logout(){
        UserDefaults.standard.setValue(false, forKey: "isLoggedIn")
        let emptyUser = User()
        UserDefaults.standard.setCodableObject(emptyUser, forKey: "currentUser")
    }
}
