//
//  ContentView.swift
//  GardenGreens
//
//  Created by Mustafa TAVASLI on 17.07.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var context
    @Query private var vegetables : [Vegetable]
    @State private var name : String = ""
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    // Add Validations to check if name is empty
                    let vegetable = Vegetable(name: name)
                    if !name.isEmpty {
                        context.insert(vegetable)
                    }
                    name = ""
                }
            List(vegetables) { vegetable in
                Text(vegetable.name)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Garden Greens")
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .modelContainer(for: [Vegetable.self], inMemory: true)
    }
}
