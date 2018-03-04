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
    
    
    
    
    
}
