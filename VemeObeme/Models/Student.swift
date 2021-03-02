//
//  Student.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation


struct Student: Codable, Hashable {
    public var idEstudiante: Int?
    public var fechaNacimiento: String?
    public var genero: String?
    public var estancias: [Stay]?
    public var universidad: University?
}
