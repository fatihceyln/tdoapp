//
//  todoappApp.swift
//  todoapp
//
//  Created by Fatih Kilit on 24.01.2022.
//

import SwiftUI

@main
struct todoappApp: App {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(vm)
        }
    }
}
