//
//  CustomUserDefaultSave.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran
//

import Foundation

extension UserDefaults {
    func setcodableObject<T : Codable>(dataType: T.Type, key: String) -> T? {
      guard let userDefaultData = data(forKey: key) else {
        return nil
      }
      return try? JSONDecoder().decode(T.self, from: userDefaultData)
    }
}
