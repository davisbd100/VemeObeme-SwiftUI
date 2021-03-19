//
//  SupervisionObservationViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation

class SupervisionObservationViewModel: ObservableObject {
    @Published var newSupervisionObservation = SupervisionObservation()
    
    func registerPositiveObservation(completion: @escaping(Bool) -> ()) {
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        
        ObservationNetworkManager().addSupervisionObservation(supervisionObservation: newSupervisionObservation) {
            
            debugPrint($0 as Any)
            debugPrint($1 as Any)
            if ($1 != nil){
                completion(false)
            }else{
                completion(true)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished register process")
        }
    }
}
