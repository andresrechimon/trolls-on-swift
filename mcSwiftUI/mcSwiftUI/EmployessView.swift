//
//  EmployessView.swift
//  mcSwiftUI
//
//  Created by Certant on 28/07/2023.
//

import SwiftUI

struct EmployessView: View {
    @EnvironmentObject var employees:EmployessModel
    var body: some View {
        NavigationView {
            List
            {
                ForEach(employees.employees){ employee in
                    NavigationLink(destination:Details(employee: employee)){
                        EmployeeRow(employee: employee)
                    }
                }
        }
            .listStyle(PlainListStyle())
            .navigationTitle("Trolls")
        }
        
    }
}

struct EmployessView_Previews: PreviewProvider {
    static var previews: some View {
        EmployessView().environmentObject(EmployessModel())
    }
}

struct EmployeeRow: View {
    let employee:Employee
    @ObservedObject var imgEmployee = NetworkModel()
    var body: some View {
        HStack{
            imgEmployee.avatar.resizable().frame(width: 50, height: 50)
            VStack(alignment: .leading) {
                Text("\(employee.username)")
                Text("\(employee.email)").font(.footnote)
            }
            Spacer()
            Image(systemName: "folder.badge.person.crop")
        }
        .onAppear{
            imgEmployee.getImage(url: employee.avatar)
        }
    }
}
