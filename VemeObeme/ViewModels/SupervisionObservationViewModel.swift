//
//  SupervisionObservationViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation

class SupervisionObservationViewModel: ObservableObject {
    @Published var newSupervisionObservation = SupervisionObservation()
    @Published var isError = false
    func registerSupervisionObservation(completion: @escaping(Bool) -> ()) {
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
    func getServiceArea(completion: @escaping([ServiceArea]) -> ()){
        let dispatch = DispatchGroup()
        
        
        dispatch.enter()
        GetPublicInfoManager().getServiceAreas(countryId: (UserDefaults.standard.getcodableObject(dataType: User.self, key: "currentUser")?.estudiante?.estancias?.last?.institucionSalud?.pais?.idPais)!){
            if $0.isEmpty {
                self.isError = true
                completion($0)
            }else{
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Searching for service areas")
        }
    }
}
