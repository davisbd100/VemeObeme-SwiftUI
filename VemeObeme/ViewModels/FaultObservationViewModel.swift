//
//  FaultObservationViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation
import Combine

class FaultObservationViewModel: ObservableObject {
    
    @Published var comments: String = ""
    @Published var observationDate: Date = Date()
    @Published var observationHour: Date = Date()
    @Published var faultType: FaultType = FaultType()
    @Published var personType: PersonType = PersonType()
    
    @Published var isCommentsValid = false
    @Published var isRegisterDateValid = false
    @Published var isPersonTypeValid = false
    
    @Published var isError = false
    
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(faultType: FaultType) {
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
        $personType
            .receive(on: RunLoop.main)
            .map{
                personType in
                return (!(personType.personaInvolucrada?.isEmpty ?? true))
            }.assign(to: \.isPersonTypeValid, on: self)
            .store(in: &cancellableSet)
        self.faultType = faultType
    }
    func registerSupervisionObservation(completion: @escaping(Bool) -> ()) {
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        
        ObservationNetworkManager().addFaultObservation(faultObservation: FaultObservation(comentario: comments, fechaObservacion: convertDateToString(date: observationDate), horaObservacion: convertOnlyHourToString(date: observationHour), tipoFalta: faultType, personaInvolucrada: personType)) {
            
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
    func getPersonasInvolucradas(completion: @escaping([PersonType]) -> ()){
        let dispatch = DispatchGroup()

        dispatch.enter()
        GetPublicInfoManager().getPersonTypes(){
            if $0.isEmpty {
                self.isError = true
                completion($0)
            }else{
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Searching for Person Types")
        }
    }
}
