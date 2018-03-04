//
//  ImageSelector.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/4/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import Foundation
import UIKit



class ImageSelector {
    
    
    class func pickCocktailImage(title: String = "", ingredients: [String]) -> UIImage{
        
        if title.lowercased().contains("champagne") || ingredients.contains("champagne") {
            let imageName = "clearCocktail3"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("bloody") || title.contains("mary") {
            let imageName = "darkCocktail3"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("margarita"){
            let imageName = "greenCocktail3"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("martini"){
            let imageName = "clearCocktail4"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("screw"){
            let imageName = "orangeCocktail2"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("sunrise") || ingredients.contains("champagne") {
            let imageName = "orangeCocktail6"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("champagne") || ingredients.contains("champagne") {
            let imageName = "clearCocktail3"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("punch"){
            let imageName = "redCocktail15"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("wine") || ingredients.contains("wine") {
            let imageName = "redCocktail16"
            return UIImage(named: imageName)!
        }
        if title.lowercased().contains("champagne") || ingredients.contains("champagne") {
            let imageName = "clearCocktail3"
            return UIImage(named: imageName)!
        }
        
        
        return randomCocktailImage(ingredients: ingredients)
        
        
    }
    
    
    class func randomCocktailImage(ingredients : [String]) -> UIImage {
        
        let blueFilterKeywords: [String] = ["blue", "blueberry", "curacao", "grape"]
        let clearFilterKeywords: [String] = ["clear", "cream"]
        let darkFilterKeywords: [String] = ["whiskey", "bourbon", "brandy", "beer", "ale", "coke", "cola", "tea", "coffee", "cream"]
        let greenFilterKeywords: [String] = ["green", "lime", "margarita"]
        let orangeFilterKeywords: [String] = ["orange", "triple sec", "cider", "grenadine", "mango"]
        let redFilterKeywords: [String] = ["cherry", "strawberry", "watermelon", "red", "berry", "apple", "triple sec", "grenadine", "tomato"]
        let yellowFilterKeywords: [String] = ["lemon", "lime", "pear", "pineapple", "squash"]
        
        var blueCounter = 0
        var clearCounter = 0
        var darkCounter = 0
        var greenCounter = 0
        var orangeCounter = 0
        var redCounter = 0
        var yellowCounter = 0
        
        let blueMax = 1
        let clearMax = 10
        let darkMax = 6
        let greenMax = 7
        let orangeMax = 11
        let redMax = 17
        let yellowMax = 5
        
        
        
        for ingredient in ingredients {
            
            if blueFilterKeywords.contains(ingredient) {
                blueCounter += 1
            }
            else if clearFilterKeywords.contains(ingredient) {
                clearCounter += 1
            }
            else if darkFilterKeywords.contains(ingredient) {
                darkCounter += 1
            }
            else if greenFilterKeywords.contains(ingredient) {
                greenCounter += 1
            }
            else if orangeFilterKeywords.contains(ingredient) {
                orangeCounter += 1
            }
            else if redFilterKeywords.contains(ingredient) {
                redCounter += 1
            }
            else if yellowFilterKeywords.contains(ingredient) {
                yellowCounter += 1
            }

        }
        
        
        
        let counters = [blueCounter, clearCounter, darkCounter, greenCounter, orangeCounter, redCounter, yellowCounter]
        print(counters)
        var maxIndex = 0
        
        for i in 0 ..< counters.count {
            if i > 0 {
                if counters[i] > counters[maxIndex] {
                    maxIndex = i
                    print(counters[i])
                    print(counters[i-1])
                    print("larger")
                }
            }
            else {
                maxIndex = i
                print(counters[i])
                print("larger")
            }
        }
        
        print(maxIndex)
        
        var imagePrefix = "blue"
        var colorMax = 0
        
        if maxIndex == 0 {
            imagePrefix = "blueCocktail"
            colorMax = blueMax
        }
        else if maxIndex == 1 {
            imagePrefix = "clearCocktail"
            colorMax = clearMax
        }
        else if maxIndex == 2 {
            imagePrefix = "darkCocktail"
            colorMax = darkMax
        }
        else if maxIndex == 3 {
            imagePrefix = "greenCocktail"
            colorMax = greenMax
        }
        else if maxIndex == 4 {
            imagePrefix = "orangeCocktail"
            colorMax = orangeMax
        }
        else if maxIndex == 5 {
            imagePrefix = "redCocktail"
            colorMax = redMax
        }
        else if maxIndex == 6 {
            imagePrefix = "yellowCocktail"
            colorMax = yellowMax
        }
        
        
        var imageSuffix = "1"
        let randomValue = arc4random_uniform(UInt32(colorMax)) + 1;
        imageSuffix = String(randomValue)
        
        let imageName = imagePrefix + imageSuffix
        
        print(imageName)
        
        return UIImage(named: imageName)!
        
        
    }
    
    
    class func pickIngredientImage(title: String) -> UIImage{
        
        if title.lowercased().contains("ale") {
            return UIImage(named: "ale")!
        }
        else if title.lowercased().contains("bourbon") {
            return UIImage(named: "bourbon")!
        }
        else if title.lowercased().contains("brandy") {
            return UIImage(named: "brandy")!
        }
        else if title.lowercased().contains("champagne") {
            return UIImage(named: "champagne1")!
        }
        else if title.lowercased().contains("gin") {
            return UIImage(named: "gin")!
        }
        else if title.lowercased().contains("rum") {
            return UIImage(named: "rum")!
        }
        else if title.lowercased().contains("scotch") {
            return UIImage(named: "scotch")!
        }
        else if title.lowercased().contains("tequila") {
            return UIImage(named: "tequila")!
        }
        else if title.lowercased().contains("vodka") {
            return UIImage(named: "vodka2")!
        }
        else if title.lowercased().contains("whiskey") {
            return UIImage(named: "whiskey2")!
        }
        else if title.lowercased().contains("amaretto") {
            return UIImage(named: "amaretto")!
        }
        else if title.lowercased().contains("apple") {
            return UIImage(named: "apple")!
        }
        else if title.lowercased().contains("apple") && title.lowercased().contains("juice") {
            return UIImage(named: "applejuice")!
        }
        else if title.lowercased().contains("banana") {
            return UIImage(named: "banana")!
        }
        else if title.lowercased().contains("beer") {
            return UIImage(named: "beer1")!
        }
        else if title.lowercased().contains("curacao") {
            return UIImage(named: "bluecuracao")!
        }
        else if title.lowercased().contains("cherry") {
            return UIImage(named: "cherry")!
        }
        else if title.lowercased().contains("cherry") && title.lowercased().contains("juice") {
            return UIImage(named: "cherryjuice")!
        }
        else if title.lowercased().contains("cider") {
            return UIImage(named: "cider")!
        }
        else if title.lowercased().contains("coffee") {
            return UIImage(named: "coffee")!
        }
        else if title.lowercased().contains("cola") {
            return UIImage(named: "cola")!
        }
        else if title.lowercased().contains("cream") {
            return UIImage(named: "cream")!
        }
        else if title.lowercased().contains("drink") {
            return UIImage(named: "drink")!
        }
        else if title.lowercased().contains("egg") {
            return UIImage(named: "egg")!
        }
        else if title.lowercased().contains("grape") && title.lowercased().contains("juice") {
            return UIImage(named: "grapejuice")!
        }
        else if title.lowercased().contains("green") && title.lowercased().contains("juice") {
            return UIImage(named: "greenjuice")!
        }
        else if title.lowercased().contains("grenadine") {
            return UIImage(named: "grenadine")!
        }
        else if title.lowercased().contains("tea") && title.lowercased().contains("ice") {
            return UIImage(named: "ice-tea")!
        }
        else if title.lowercased().contains("lemonade") {
            return UIImage(named: "lemonade")!
        }
        else if title.lowercased().contains("lemon") {
            return UIImage(named: "lemon")!
        }
        else if title.lowercased().contains("lime") {
            return UIImage(named: "lime")!
        }
        else if title.lowercased().contains("lime") && title.lowercased().contains("juice") {
            return UIImage(named: "limejuice")!
        }
        else if title.lowercased().contains("mango") {
            return UIImage(named: "mango")!
        }
        else if title.lowercased().contains("melon") && title.lowercased().contains("juice") {
            return UIImage(named: "melonjuice")!
        }
        else if title.lowercased().contains("milk") {
            return UIImage(named: "milk")!
        }
        else if title.lowercased().contains("orange") && title.lowercased().contains("juice") {
            return UIImage(named: "orangejuice")!
        }
        else if title.lowercased().contains("orange") {
            return UIImage(named: "orange")!
        }
        else if title.lowercased().contains("peach") {
            return UIImage(named: "peach")!
        }
        else if title.lowercased().contains("pear") {
            return UIImage(named: "pear")!
        }
        else if title.lowercased().contains("pineapple") {
            return UIImage(named: "pineapple")!
        }
        else if title.lowercased().contains("punch") {
            return UIImage(named: "punch")!
        }
        else if title.lowercased().contains("rose") {
            return UIImage(named: "rosemary")!
        }
        else if title.lowercased().contains("salt") {
            return UIImage(named: "salt")!
        }
        else if title.lowercased().contains("soda") {
            return UIImage(named: "soda")!
        }
        else if title.lowercased().contains("soft") {
            return UIImage(named: "soft-drink")!
        }
        else if title.lowercased().contains("squash") {
            return UIImage(named: "squash")!
        }
        else if title.lowercased().contains("straw") {
            return UIImage(named: "strawberry")!
        }
        else if title.lowercased().contains("sugar") {
            return UIImage(named: "sugar")!
        }
        else if title.lowercased().contains("syrup") {
            return UIImage(named: "syrup")!
        }
        else if title.lowercased().contains("tea") {
            return UIImage(named: "tea")!
        }
        else if title.lowercased().contains("tomato") && title.lowercased().contains("juice") {
            return UIImage(named: "tomatojuice")!
        }
        else if title.lowercased().contains("tonic") {
            return UIImage(named: "tonic")!
        }
        else if title.lowercased().contains("watermelon") {
            return UIImage(named: "watermelon")!
        }
        else if title.lowercased().contains("watermelon") && title.lowercased().contains("juice") {
            return UIImage(named: "watermelonjuice")!
        }
        else if title.lowercased().contains("ice") {
            return UIImage(named: "ice")!
        }
        
        
        
        
        
        let defaultImage = UIImage(named: "genericIngredient")
        return defaultImage!
        
    }
    
    
    
}
