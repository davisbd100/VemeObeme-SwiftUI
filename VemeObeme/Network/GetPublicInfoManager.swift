//
//  GetPublicInfoManager.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 16/02/21.
//

import Foundation

class GetPublicInfoManager {
    private var hostname: String = URL.myUrlBase
    
    func getCountry(completion: @escaping([Country]) -> ()){
        
        guard let url = URL(string: hostname + "paises/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: sentData)
                    completion(countries)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                    completion([])
                }
            }
        }
        task.resume()
    }
    func getUniversityByCountry(countryId: Int, completion: @escaping([University]) -> ()){
        
        guard let url = URL(string: hostname + "universidades/" + "\(countryId)") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let university = try JSONDecoder().decode([University].self, from: sentData)
                    completion(university)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    func getHealthInstitutionByCountry(completion: @escaping([HealthInstitution]) -> ()){
        
        guard let url = URL(string: hostname + "instituciones/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let healtInstitution = try JSONDecoder().decode([HealthInstitution].self, from: sentData)
                    completion(healtInstitution)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    func getSpecialities(completion: @escaping([Specialty]) -> ()){
        
        guard let url = URL(string: hostname + "especialidades/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let specialty = try JSONDecoder().decode([Specialty].self, from: sentData)
                    completion(specialty)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                }
            }
        }
        task.resume()
    }
    func getServiceAreas(countryId: Int, completion: @escaping([ServiceArea]) -> ()){
        
        guard let url = URL(string: hostname + "areasservicio/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let serviceArea = try JSONDecoder().decode([ServiceArea].self, from: sentData)
                    completion(serviceArea)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                    completion([])
                }
            }
        }
        task.resume()
    }
    func getPersonTypes(completion: @escaping([PersonType]) -> ()){
        
        
        guard let url = URL(string: hostname + "personasinvolucradas/") else {
            fatalError("URL Unreacheble")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let currentUser = UserDefaults.standard.getcodableObject(dataType: User.self, key: "currentUser")
        request.setValue("Bearer " + (currentUser?.jwt)!, forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let sentData = data, error == nil, let responseData = response as? HTTPURLResponse else {
                return
            }
            if (responseData.statusCode == 200){
                do {
                    let typeList = try JSONDecoder().decode([PersonType].self, from: sentData)
                    completion(typeList)
                } catch let error {
                    debugPrint("Error: \(error.localizedDescription)")
                    completion([])
                }
            }
        }
        task.resume()
    }
}
