//
//  User.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 01/03/21.
//

import Foundation
struct User: Codable, Hashable {
    public var idUsuario: Int?
    public var correo: String?
    public var password: String?
    public var activo: String?
    public var roles: [Role]?
    public var estudiante: Student?
    public var jwt: String?
}
