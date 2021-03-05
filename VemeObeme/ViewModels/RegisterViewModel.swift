//
//  RegisterViewModel.swift
//  VemeObeme
//
//  Created by David Bárcenas Duran on 09/12/20.
//

import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    
    @Published var gender = ""
    @Published var birthDate = Calendar.current.date(byAdding: .year, value: -19, to: Date())!
    @Published var country: Country = Country()
    @Published var university: University = University()
    @Published var healthInstitution: HealthInstitution = HealthInstitution()
    @Published var stayType: StayType = StayType()
    @Published var speciality: Specialty = Specialty()
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
    @Published var isResidencySelected = false
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
                return (!(country.nombre?.isEmpty ?? true) && country.nombre != "País")
            }.assign(to: \.isCountryValid, on: self)
            .store(in: &cancellableSet)
        $university
            .receive(on: RunLoop.main)
            .map{
                university in
                return (!(university.nombre?.isEmpty ?? true) && university.nombre != "Universidad")
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
                return (!(healthInstitution.nombre?.isEmpty ?? true) && healthInstitution.nombre != "Institución de Salud")
            }.assign(to: \.isHealthInstitutionValid, on: self)
            .store(in: &cancellableSet)
        $stayType
            .receive(on: RunLoop.main)
            .map{
                stayType in
                return !stayType.nombre!.isEmpty
            }.assign(to: \.isStayTypeValid, on: self)
            .store(in: &cancellableSet)
        $stayType
            .receive(on: RunLoop.main)
            .map{
                stayType in
                return stayType.nombre == "Residencia"
            }.assign(to: \.isResidencySelected, on: self)
            .store(in: &cancellableSet)
        $speciality
            .receive(on: RunLoop.main)
            .map{
                especiality in
                return (!(especiality.nombre?.isEmpty ?? true) && especiality.nombre != "Institución de Salud")
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
    
    func getCountries(completion: @escaping([Country]) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        GetPublicInfoManager().getCountry(){
            if $0.isEmpty {
                self.isError = true
                completion($0)
            }else{
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Searching for countries")
        }
    }
    func getUniversityByCountry(completion: @escaping([University]) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        GetPublicInfoManager().getUniversityByCountry(countryId: self.country.idPais!){
            if $0.isEmpty {
                completion($0)
            }else{
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Searching for universities")
        }
    }
    func getHealtInstitutionByCountry(completion: @escaping([HealthInstitution]) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        GetPublicInfoManager().getHealthInstitutionByCountry(){
            if $0.isEmpty {
                completion($0)
            }else{
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Searching for health institutions")
        }
    }
    func getSpecialties(completion: @escaping([Specialty]) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        GetPublicInfoManager().getSpecialities(){
            if $0.isEmpty {
                completion($0)
            }else{
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Searching for specialties")
        }
    }
    func checkIfEmailExists(completion: @escaping(Bool) -> ()){
        let dispatch = DispatchGroup()
        
        dispatch.enter()
        NetworkDataValidations().CheckIfEmailExists(email: username){
            completion($0)
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished Checking Mail")
        }
    }
    
    func tryRegister(completion: @escaping(User) -> ()){
        let dispatch = DispatchGroup()
        var tempUser: User
        if isResidencySelected{
            tempUser = User(correo: username, password: password, activo: true, estudiante: Student(fechaNacimiento: convertDateToString(date: birthDate), genero: gender, estancias: [Stay(fechaInicio: convertDateToString(date: startDate), fechaFin: convertDateToString(date: endDate), institucionSalud: healthInstitution, especialidad: speciality)], universidad: university))
        }else{
            tempUser = User(correo: username, password: password, activo: true, estudiante: Student(fechaNacimiento: convertDateToString(date: birthDate), genero: gender, estancias: [Stay(fechaInicio: convertDateToString(date: startDate), fechaFin: convertDateToString(date: endDate), institucionSalud: healthInstitution)], universidad: university))
        }
        dispatch.enter()
        UserManagementPetitionManager().tryRegister(user: tempUser) {
            self.currentUser = $0
            if (self.currentUser.correo == nil){
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion($0)
            }else if(self.currentUser.jwt != ""){
                DispatchQueue.main.async {
                    self.isError = false
                }
                UserDefaults.standard.setCodableObject(self.currentUser, forKey: "currentUser")
                completion($0)
            }else{
                DispatchQueue.main.async {
                    self.isError = true
                }
                completion($0)
            }
            dispatch.leave()
        }
        dispatch.notify(queue: .main){
            print("Finished register process")
        }
    }

}
