//
//  PositiveObservation.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 16/03/21.
//

import Foundation

struct PositiveObservation: Codable, Hashable {
    public var comentario: String = ""
    public var fechaObservacion: String?
    public var fechaRegistro: String?
    public var horaObservacion: String?
    public var cumplimientoPrograma: Bool = false
    public var enseñanza: Bool = false
    public var evaluacionesAprendizaje: Bool = false
    public var instalaciones: Bool = false
    public var retroalimentacion: Bool = false
    public var tratoAdscritos: Bool = false
    public var tratoDocente: Bool = false
    public var tratoTrabajadores: Bool = false
}
