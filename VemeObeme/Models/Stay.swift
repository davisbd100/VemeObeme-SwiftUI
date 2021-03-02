//
//  Stay.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 01/03/21.
//

import Foundation

struct Stay: Codable, Hashable {
    public var idEstancia: Int?
    public var fechaInicio: String?
    public var fechaFin: String?
    public var institucionSalud: HealthInstitution?
    public var tipoEstancia: StayType?
    public var especialidad: Specialty?
}
