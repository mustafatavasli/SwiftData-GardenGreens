//
//  Note.swift
//  GardenGreens
//
//  Created by Mustafa TAVASLI on 17.07.2024.
//

import Foundation
import SwiftData

@Model
class Note {
    
    var text : String
    var vegetable : Vegetable?
    
    init(text: String) {
        self.text = text
    }
}
