//
//  SupervisionObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation

struct SupervisionObservation: Codable, Hashable {
    public var comentario: String = ""
    public var fechaObservacion: String = convertDateToString(date: Date())
    public var fechaRegistro: String = convertDateToString(date: Date())
    public var horaObservacion: String = convertOnlyHourToString(date: Date())
    public var areaServicio: ServiceArea?
}
