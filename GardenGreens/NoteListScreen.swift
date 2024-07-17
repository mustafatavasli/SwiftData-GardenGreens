//
//  NoteListScreen.swift
//  GardenGreens
//
//  Created by Mustafa TAVASLI on 17.07.2024.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    
    @Environment(\.modelContext) private var context
    let vegetable : Vegetable
    @State private var text : String = ""
    
    var body: some View {
        VStack {
            TextField("Add a Note", text: $text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    let note = Note(text: text)
                    //note.vegetable = vegetable
                    vegetable.notes.append(note)
                }
            
            List(vegetable.notes) { note in
                Text(note.text)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(vegetable.name)
    }
}

struct NoteListContainerScreen : View {
    
    @Query private var vegetables : [Vegetable]
    
    var body: some View {
        NoteListScreen(vegetable: vegetables[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        NoteListContainerScreen()
            .modelContainer(previewContainer)
    }
}
