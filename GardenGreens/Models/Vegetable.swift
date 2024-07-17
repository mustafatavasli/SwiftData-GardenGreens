//
//  Vegetable.swift
//  GardenGreens
//
//  Created by Mustafa TAVASLI on 17.07.2024.
//

import Foundation
import SwiftData

@Model
class Vegetable {
    
    var name : String
    @Relationship(deleteRule: .cascade) var notes : [Note] = []
    
    init(name: String) {
        self.name = name
    }
}
