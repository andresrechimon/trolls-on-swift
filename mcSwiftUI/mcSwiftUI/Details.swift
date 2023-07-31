//
//  Details.swift
//  mcSwiftUI
//
//  Created by Certant on 28/07/2023.
//

import SwiftUI

struct Details: View {
 let employee:Employee;
@ObservedObject var imgEmployee = NetworkModel()
    var body: some View {
        VStack{
            imgEmployee.avatar.resizable().frame(width: 300, height: 300).background(Color.purple).clipShape(Circle()).onAppear{
                imgEmployee.getImage(url: employee.avatar)
            }.padding(.bottom, 10)
            VStack(alignment: .leading){
                Text("ID: \(employee.id)").bold()
                Text("USERNAME: \(employee.username)").bold()
                Text("FULL NAME: \(employee.lastName), \(employee.firstName)").bold()
                Text("COMPANY: \(employee.company)").bold()
                Text("JOB: \(employee.jobtitle)").bold()
                Text("ADDRESS: \(employee.address)").bold()
                Text("E-MAIL: \(employee.email)").bold()
            }
        }
        Spacer()
    }
}

