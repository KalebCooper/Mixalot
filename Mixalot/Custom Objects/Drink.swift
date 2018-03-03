//
//  Drinks.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import Foundation

class Drink {
    
    // MARK: - Properties
    var id: String!
    var name: String!
    var glass: String!
    var instruction: String!
    var pictureID: String!
    var ingredients: [String]!
    var dateModified: String!
    
    public init(id: String, name: String, glass: String, instruction: String, pictureID: String, ingredients: [String], dateModified: String) {
        self.id = id
        self.name = name
        self.glass = glass
        self.instruction = instruction
        self.ingredients = ingredients
        self.pictureID = pictureID
        self.dateModified = dateModified
    }
    
}
