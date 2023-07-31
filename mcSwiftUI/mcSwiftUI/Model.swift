//
//  Model.swift
//  mcSwiftUI
//
//  Created by Certant on 28/07/2023.
//

import SwiftUI
import Combine

struct Employee: Codable, Identifiable {
    let id: Int
    let firstName, lastName, email: String
    let gender: Gender
    let company: String
    let department: Department
    let jobtitle, address, username: String
    let avatar: URL

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case email, gender, company, department, jobtitle, address, username, avatar
    }
}

enum Department: String, Codable {
    case accounting = "Accounting"
    case businessDevelopment = "Business Development"
    case engineering = "Engineering"
    case humanResources = "Human Resources"
    case legal = "Legal"
    case marketing = "Marketing"
    case productManagement = "Product Management"
    case researchAndDevelopment = "Research and Development"
    case sales = "Sales"
    case services = "Services"
    case support = "Support"
    case training = "Training"
}

enum Gender: String, Codable {
    case agender = "Agender"
    case bigender = "Bigender"
    case female = "Female"
    case genderfluid = "Genderfluid"
    case genderqueer = "Genderqueer"
    case male = "Male"
    case nonBinary = "Non-binary"
    case polygender = "Polygender"
}

class EmployessModel:ObservableObject {
    @Published var employees:[Employee]
    
    init() {
        guard let url = Bundle.main.url(forResource: "employees", withExtension: "json")else {
            employees = []
            return
        }
        do{
            let data = try Data(contentsOf: url)
            employees = try JSONDecoder().decode([Employee].self, from: data)
        }
        catch{
            print("Error en la carga de empleados...")
            employees = []
        }
    }
}

class NetworkModel:ObservableObject {
    @Published var avatar = Image(systemName: "person.fill")
    var subscriber = Set<AnyCancellable>()
    func getImage(url:URL){
        URLSession
            .shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap{UIImage(data: $0)}
            .map{Image(uiImage: $0)}
            .replaceEmpty(with: Image(systemName: "person.fill"))
            .replaceError(with: Image(systemName: "person.fill"))
            .assign(to: \.avatar, on: self)
            .store(in: &subscriber)
    }
}
