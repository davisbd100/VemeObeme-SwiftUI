//
//  FaultObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 19/03/21.
//

import Foundation
struct FaultObservation: Codable, Hashable {
    public var comentario: String = ""
    public var fechaObservacion: String?
    public var fechaRegistro: String = convertDateToString(date: Date())
    public var horaObservacion: String?
    public var tipoFalta: FaultType?
    public var personaInvolucrada: PersonType?
}
