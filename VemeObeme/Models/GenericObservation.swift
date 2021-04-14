//
//  GenericObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//


import Foundation

struct GenericObservation: Codable, Hashable {
    public var tipoObservacion: String?
    public var codigo: String?
    public var fechaObservacion: String?
    public var fechaRegistro: String?
    public var horaObservacion: String?
    public var especialidad: String?
    public var institucionSalud: String?
    public var comentarios: String?
}

