//
//  GardenGreensApp.swift
//  GardenGreens
//
//  Created by Mustafa TAVASLI on 17.07.2024.
//

import SwiftUI

@main
struct GardenGreensApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .modelContainer(for: [Vegetable.self])
            }
        }
    }
}
