//
//  DrinkDatabase.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import Foundation
import SwiftyJSON

class DrinkDatabase {
    
    // MARK: - Alcoholic query constants
    private static var ALCHOLIC_DRINK_QUERY = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
    private static var DRINKS_KEY = "drinks"
    private static var DRINKS_ID = "idDrink"
    
    // MARK: - Ingredient query constants
    private static var INGREDIENT_QUERY = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i="
    
    private init() {
        
    }
    
    /*class func getAlcoholicDrinks(with_completion completion: (_ jsonObject: JSON?) -> ()) {
        if let url = URL(string: DrinkDatabase.ALCHOLIC_DRINK_QUERY) {
            if let jsonObject = getEncodedJSON(url: url, key: DRINKS_KEY) {
                completion(jsonObject)
            }
            else {
                completion(nil)
            }
        }
        else {
            completion(nil)
        }
    }*/
    
    class func getDrinks(with_ingredient ingredient: String, with_completion completion: (_ jsonObject: JSON?) -> ()) {
        if let url = URL(string: (DrinkDatabase.INGREDIENT_QUERY + ingredient)) {
            if let jsonObject = getEncodedJSON(url: url, key: DRINKS_KEY) {
                completion(jsonObject)
            }
            else {
                completion(nil)
            }
        }
        else {
            completion(nil)
        }
    }
    
    class func getIDFromDrinkJSON(json: (index: String, drink: JSON)) -> String? {
        return json.drink[DRINKS_ID].string
    }
    
    private class func getEncodedJSON(url: URL, key: String) -> JSON? {
        do {
            let jsonString = try String(contentsOf: url)
            if let jsonStringData = jsonString.data(using: .utf8, allowLossyConversion: false) {
                let json = try JSON(data: jsonStringData)
                let jsonObject = json[key]
                return jsonObject
            }
        }
        catch {
            return nil
        }
        return nil
    }
}
