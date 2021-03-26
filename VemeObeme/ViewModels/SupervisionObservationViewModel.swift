//
//  SupervisionObservationViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation
import Combine

class SupervisionObservationViewModel: ObservableObject {
    
    @Published var comments: String = ""
    @Published var observationDate: Date = Date()
    @Published var observationHour: Date = Date()
    @Published var serviceArea: ServiceArea = ServiceArea()
    
    
    @Published var isCommentsValid = false
    @Published var isRegisterDateValid = false
    @Published var isServiceAreaValid = false
    
    @Published var isError = false
    
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        $comments
            .receive(on: RunLoop.main)
            .map{
                comments in
                return (!comments.isEmpty)
            }.assign(to: \.isCommentsValid, on: self)
            .store(in: &cancellableSet)
        $observationDate
            .receive(on: RunLoop.main)
            .map{
                observationDate in
                return (observationDate < Date())
            }.assign(to: \.isRegisterDateValid, on: self)
            .store(in: &cancellableSet)
        $serviceArea
            .receive(on: RunLoop.main)
            .map{
                serviceArea in
                return (!(serviceArea.nombre?.isEmpty ?? true))
            }.assign(to: \.isServiceAreaValid, on: self)
            .store(in: &cancellableSet)
    }
    func registerSupervisionObservation(completion: @escaping(Bool) -> ()) {
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        
        ObservationNetworkManager().addSupervisionObservation(supervisionObservation: SupervisionObservation(comentario: comments, fechaObservacion: convertDateToString(date: observationDate), horaObservacion: convertOnlyHourToString(date: observationHour), areaServicio: serviceArea)) {
            
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
