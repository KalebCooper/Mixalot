//
//  Drink.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import Foundation

class User {
    
    // MARK: - Properties
    var id: String!
    var name: String!
    var favorites: [String]!
    var createdDrinks: [String]!
    var ingredients: [String]!
    
    public init(id: String, name: String, favorites: [String] = [], createdDrinks: [String] = [], ingredients: [String] = []) {
        self.id = id
        self.name = name
        self.favorites = favorites
        self.createdDrinks = createdDrinks
        self.ingredients = ingredients
    }
}
