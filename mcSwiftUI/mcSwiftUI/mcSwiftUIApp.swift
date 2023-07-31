//
//  mcSwiftUIApp.swift
//  mcSwiftUI
//
//  Created by Certant on 27/07/2023.
//

import SwiftUI

@main
struct mcSwiftUIApp: App {
    @StateObject var employees = EmployessModel()
    var body: some Scene {
        WindowGroup {
            EmployessView().environmentObject(employees)
        }
    }
}
