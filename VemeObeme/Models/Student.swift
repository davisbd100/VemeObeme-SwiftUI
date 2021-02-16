//
//  Student.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 11/11/20.
//

import Foundation


struct User: Codable, Hashable {
    public var correo: String?
    public var jwt: String?
    public var nombres: String?
    public var apellidos: String?
    public var fechaNacimiento: String?
    public var genero: String?
    public var rol: String?
    public var university: University?
    public var healtInstitution: HealthInstitution?
}
