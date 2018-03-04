//
//  FBDatabase.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import Foundation
import Firebase

class FBDatabase {
    
    // MARK: - Properties
    private static let EMAIL = "email"
    private static let PASSWORD = "password"
    private static let ID = "id"
    
    private static let USERS_NODE = "Users"
    private static let DRINKS_NODE = "Drinks"
    private static let USER_ID = "id"
    private static let USER_NAME = "name"
    private static let USER_FAVORITES = "favorites"
    private static let USER_CREATED_DRINKS = "created drinks"
    private static let USER_INGREDIENTS = "ingredients"
    
    private static let DRINK_ID = "id"
    private static let DRINK_NAME = "name"
    private static let DRINK_GLASS = "glass"
    private static let DRINK_INSTRUCTION = "instruction"
    private static let DRINK_PICTURE_ID = "picture id"
    private static let DRINK_DATE_MODIFIED = "date modified"
    
    private init() {
        
    }
    
    class func createAccount(email: String, password: String, with_completion completion: @escaping (_ id: String?, _ error: String?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password, completion: {(userData, error) in
            if let actualError = error {
                // Error
                UserDefaults.standard.set(email, forKey: EMAIL)
                UserDefaults.standard.set(password, forKey: PASSWORD)
                completion(nil, actualError.localizedDescription)
            }
            else {
                completion(userData?.uid, nil)
            }
        })
    }
    
    class func signIn(email: String, password: String, with_completion completion: @escaping (_ id: String?, _ error: String?) -> ()){
        Auth.auth().signIn(withEmail: email, password: password, completion: {(userData, error) in
            if let actualError = error {
                // Error
                completion(nil, actualError.localizedDescription)
            }
            else {
                // No Error
                completion(userData?.uid, nil)
            }
        })
    }
    
    class func setAutomaticSignIn(email: String, password: String, id: String) {
        UserDefaults.standard.set(email, forKey: EMAIL)
        UserDefaults.standard.set(password, forKey: PASSWORD)
        UserDefaults.standard.set(id, forKey: ID)
    }
    
    class func removeAutomaticSignIn() {
        UserDefaults.standard.set(nil, forKey: EMAIL)
        UserDefaults.standard.set(nil, forKey: PASSWORD)
        UserDefaults.standard.set(nil, forKey: ID)
    }
    
    class func getSignedInID() -> String? {
        if let id = UserDefaults.standard.value(forKey: ID) as? String {
            return id
        }
        else {
            return nil
        }
    }
    
    class func signOutActiveUser(with_completion completion: (_ error: Bool) -> ()) {
        do {
            try Auth.auth().signOut()
            completion(false)
        }
        catch {
            completion(true)
        }
    }
    
    class func getSignedInEmailPassword() -> (email : String, password : String)? {
        if let email = UserDefaults.standard.value(forKey: EMAIL), let password = UserDefaults.standard.value(forKey: PASSWORD) {
            return ((email : email, password : password) as! (email: String, password: String))
        }
        else {
            return nil
        }
    }
    
    class func getUser(with_id id: String, ref: DatabaseReference ,with_completion completion: @escaping (_ user: User?) -> ()) {
        ref.observe(.value, with: {(snapshot) in
            if let root = snapshot.value as? NSDictionary {
                if let usersNode = root[USERS_NODE] as? NSDictionary {
                    if let user = usersNode[id] as? [String : Any] {
                        let id = user[USER_ID] as! String
                        let name = user[USER_NAME] as! String
                        var favorites: [String] = []
                        var createdDrinks: [String] = []
                        var ingredients: [String] = []
                        if let optFavorites = user[USER_FAVORITES] as? [String] {
                            favorites = optFavorites
                        }
                        if let optCreatedDrinks = user[USER_CREATED_DRINKS] as? [String] {
                            createdDrinks = optCreatedDrinks
                        }
                        if let optIngredients = user[USER_INGREDIENTS] as? [String] {
                            ingredients = optIngredients
                        }
                        let userObject = User(id: id, name: name, favorites: favorites, createdDrinks: createdDrinks, ingredients: ingredients)
                        completion(userObject)
                        
                    }
                    else {
                        completion(nil)
                    }
                }
                else {
                    completion(nil)
                }
            }
            else {
                completion(nil)
            }
        })
    }
    
    class func addUpdateUser(user: User, with_completion completion: @escaping (_ error: String?) -> ()) {
        let ref = Database.database().reference()
        let json = [USER_ID : user.id, USER_NAME : user.name, USER_FAVORITES : user.favorites, USER_CREATED_DRINKS : user.createdDrinks, USER_INGREDIENTS : user.ingredients] as [String : Any]
        ref.child(USERS_NODE).child(user.id).setValue(json, withCompletionBlock: {(error, ref) in
            if let actualError = error {
                // Error
                completion(actualError.localizedDescription)
            }
            else {
                completion(nil)
            }
        })
    }
    
    class func addUpdateDrink(drink: Drink, with_completion completion: @escaping (_ error: String?) -> ()) {
        let ref = Database.database().reference()
        let json = [DRINK_ID : drink.id, DRINK_NAME : drink.name, DRINK_GLASS : drink.glass, DRINK_INSTRUCTION : drink.instruction, DRINK_PICTURE_ID : drink.pictureID, DRINK_DATE_MODIFIED : drink.dateModified] as [String : Any]
        ref.child(DRINKS_NODE).child(drink.id).setValue(json, withCompletionBlock: {(error, ref) in
            if let actualError = error {
                // Error
                completion(actualError.localizedDescription)
            }
            else {
                completion(nil)
            }
        })
    }
    
}
