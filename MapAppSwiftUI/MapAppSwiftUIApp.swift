//
//  MapAppSwiftUIApp.swift
//  MapAppSwiftUI
//
//  Created by Umut Ağbaba on 8.04.2023.
//

import SwiftUI

@main
struct MapAppSwiftUIApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
