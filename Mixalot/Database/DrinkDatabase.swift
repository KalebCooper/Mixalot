//
//  DrinkDatabase.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import Foundation

class DrinkDatabase {
    
    private static var ALCHOLIC_DRINK_QUERY = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
    
    private init() {
        
    }
    
    class func getAlcoholicDrinks() {
        let url = URL(string: DrinkDatabase.ALCHOLIC_DRINK_QUERY)
        if url != nil {
            do {
                let jsonString = try String(contentsOf: url!)
                print(jsonString)
            }
            catch {
                print("Could not get json string")
            }
        }
    }
}
