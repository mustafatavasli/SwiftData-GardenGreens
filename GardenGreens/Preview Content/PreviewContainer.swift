//
//  PreviewContainer.swift
//  GardenGreens
//
//  Created by Mustafa TAVASLI on 17.07.2024.
//

import Foundation
import SwiftData

@MainActor
let previewContainer : ModelContainer = {
    
    do {
        let container = try ModelContainer(for: Vegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        SampleData.vegetables.forEach { vegetable in
            container.mainContext.insert(vegetable)
        }
        
        return container
    } catch {
        fatalError("Failed to Create Container")
    }
    
}()

// Dummy Data
struct SampleData {
    static let vegetables : [Vegetable] = {
        return [Vegetable(name: "Tomato"), Vegetable(name: "Turnip"), Vegetable(name: "Onion")]
    }()
}
