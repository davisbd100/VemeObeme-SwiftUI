//
//  RegisterViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 09/12/20.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    
    @Published var gender = "Género"
    @Published var birthDate = Calendar.current.date(byAdding: .year, value: -19, to: Date())!
    @Published var country = "País"
    @Published var university = "Universidad"
    @Published var healthInstitution = "Institucion de Salud"
    @Published var stayType = "Tipo de Estancia"
    @Published var especiality = "Especialidad"
    @Published var startDate = Calendar.current.date(byAdding: .year, value: -19, to: Date())!
    @Published var endDate = Calendar.current.date(byAdding: .year, value: -19, to: Date())!
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""

    @Published var isGenderValid = false
    @Published var isBirthDateValid = false
    @Published var isCountryValid = false
    @Published var isUniversityValid = false
    @Published var isHealthInstitutionValid = false
    @Published var isStayTypeValid = false
    @Published var isEspecialityValid = false
    @Published var isStartDateValid = false
    @Published var isEndDateValid = false
    @Published var isMailValid = false
    @Published var isPasswordValid = false
    @Published var isError = false
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    private var currentUser = User()
    
    
    init() {
        $username
            .receive(on: RunLoop.main)
            .map{
                username in
                return isValidEmail(email: username)
            }.assign(to: \.isMailValid, on: self)
            .store(in: &cancellableSet)
        $password
            .receive(on: RunLoop.main)
            .map{
                password in
                return isValidPasword(pass: password)
            }.assign(to: \.isPasswordValid, on: self)
            .store(in: &cancellableSet)
        $gender
            .receive(on: RunLoop.main)
            .map{
                gender in
                return (!gender.isEmpty && gender != "Género")
            }.assign(to: \.isGenderValid, on: self)
            .store(in: &cancellableSet)
        $country
            .receive(on: RunLoop.main)
            .map{
                country in
                return (!country.isEmpty && country != "País")
            }.assign(to: \.isCountryValid, on: self)
            .store(in: &cancellableSet)
        $university
            .receive(on: RunLoop.main)
            .map{
                university in
                return (!university.isEmpty && university != "Universidad")
            }.assign(to: \.isUniversityValid, on: self)
            .store(in: &cancellableSet)
        $birthDate
            .receive(on: RunLoop.main)
            .map{
                birthDate in
                return (Calendar.current.date(byAdding: .year, value: -100, to: Date())! <= birthDate)
            }.assign(to: \.isBirthDateValid, on: self)
            .store(in: &cancellableSet)
        $healthInstitution
            .receive(on: RunLoop.main)
            .map{
                healthInstitution in
                return !healthInstitution.isEmpty
            }.assign(to: \.isHealthInstitutionValid, on: self)
            .store(in: &cancellableSet)
        $stayType
            .receive(on: RunLoop.main)
            .map{
                stayType in
                return !stayType.isEmpty
            }.assign(to: \.isStayTypeValid, on: self)
            .store(in: &cancellableSet)
        $especiality
            .receive(on: RunLoop.main)
            .map{
                especiality in
                return !especiality.isEmpty
            }.assign(to: \.isEspecialityValid, on: self)
            .store(in: &cancellableSet)
        $startDate
            .receive(on: RunLoop.main)
            .map{
                startDate in
                return (Calendar.current.date(byAdding: .year, value: -19, to: Date())! <= startDate)
            }.assign(to: \.isStartDateValid, on: self)
            .store(in: &cancellableSet)
        $endDate
            .receive(on: RunLoop.main)
            .map{
                endDate in
                return (Calendar.current.date(byAdding: .year, value: -19, to: Date())! <= endDate)
            }.assign(to: \.isEndDateValid, on: self)
            .store(in: &cancellableSet)
        
    }
    
    func tryRegister(completion: @escaping(String) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        PetititonManager().tryLogin(username: username, password: password) {
            self.currentUser = $0
            if (self.currentUser.correo == nil){
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion("No existe el usuario: " + self.username)
            }else if(self.currentUser.jwt != ""){
                DispatchQueue.main.async {
                    self.isError = false
                }
                completion("Ok")
            }else{
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion("Error no identificado")
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Task")
        }
    }
    
    func checkFields() -> Bool {
        var validation = false
        if (username.isEmpty || password.isEmpty) {
            validation = false
        }else{
            validation = !isValidEmail(email: username)
        }
        return validation
    }
}
