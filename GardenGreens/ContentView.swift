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
                NavigationLink {
                    NoteListScreen(vegetable: vegetable)
                } label: {
                    Text(vegetable.name)
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Garden Greens")
    }
}

#Preview { @MainActor in
    NavigationStack {
        ContentView()
            .modelContainer(previewContainer)
    }
}
