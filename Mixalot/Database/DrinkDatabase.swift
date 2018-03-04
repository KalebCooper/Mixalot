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
    private static var ALL_INGREDIENT_QUERY = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
    
    // MARK: - Drink query constants
    private static var DRINK_QUERY = "https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i="
    
    private static var DRINK_NAME_QUERY = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="
    
    private static var DRINK_NAME = "strDrink"
    private static var DRINK_GLASS = "strGlass"
    private static var DRINK_INSTRUCTION = "strInstructions"
    private static var DRINK_DATE_MODIFIED = "dateModified"
    private static var DRINK_INGREDIENT = "strIngredient"
    private static var DRINK_INGREDIENT_1 = "strIngredient1"
    
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
    
    class func getDrinks(with_ingredient ingredient: String) -> JSON? {
        let finalIngredient = ingredient.replacingOccurrences(of: " ", with: "%20")
        if let url = URL(string: (DrinkDatabase.INGREDIENT_QUERY + finalIngredient)) {
            if let jsonObject = getEncodedJSON(url: url, key: DRINKS_KEY) {
                return jsonObject
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    class func getIngredients() -> [String]? {
        var ingredients: [String] = []
        if let url = URL(string: (DrinkDatabase.ALL_INGREDIENT_QUERY)) {
            if let jsonObject = getEncodedJSON(url: url, key: DRINKS_KEY) {
                for ingredient in jsonObject {
                    let jsonIndg = ingredient.1
                    ingredients.append(jsonIndg[DRINK_INGREDIENT_1].string!)
                }
                return ingredients
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    class func getDrink(with_id id: String) -> Drink? {
        if let url = URL(string: (DrinkDatabase.DRINK_QUERY + id)) {
            if let jsonObject = getEncodedJSON(url: url, key: DRINKS_KEY) {
                //print(jsonObject)
                let name = jsonObject[0][DRINK_NAME].string!
                let glass = jsonObject[0][DRINK_GLASS].string!
                let instruction = jsonObject[0][DRINK_INSTRUCTION].string!
                let dateModified = jsonObject[0][DRINK_DATE_MODIFIED].string!
                var ingredients: [String] = []
                for i in stride(from: 1, to: 15, by: 1) {
                    if let singleIngredient = jsonObject[0][DRINK_INGREDIENT + "\(i)"].string {
                        ingredients.append(singleIngredient)
                    }
                }
                let drink = Drink(id: id, name: name, glass: glass, instruction: instruction, pictureID: "", ingredients: ingredients, dateModified: dateModified)
                return drink
            }
            else {
                return nil
            }
        }
        else {
            return nil
        }
    }
    
    class func getDrink(with_name name: String) -> Drink? {
        if let url = URL(string: (DrinkDatabase.DRINK_NAME_QUERY + name)) {
            if let jsonObject = getEncodedJSON(url: url, key: DRINKS_KEY) {
                print(jsonObject)
                let id = jsonObject[0][DRINKS_ID].string!
                let name = jsonObject[0][DRINK_NAME].string!
                let glass = jsonObject[0][DRINK_GLASS].string!
                let instruction = jsonObject[0][DRINK_INSTRUCTION].string!
                let dateModified = jsonObject[0][DRINK_DATE_MODIFIED].string!
                var ingredients: [String] = []
                for i in stride(from: 1, to: 15, by: 1) {
                    if let singleIngredient = jsonObject[0][DRINK_INGREDIENT + "\(i)"].string {
                        ingredients.append(singleIngredient)
                    }
                }
                let drink = Drink(id: id, name: name, glass: glass, instruction: instruction, pictureID: "", ingredients: ingredients, dateModified: dateModified)
                return drink
            }
            else {
                return nil
            }
        }
        else {
            return nil
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
