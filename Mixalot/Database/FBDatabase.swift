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
    
    class func signIn(email: String, password: String, with_completion completion: @escaping (_ error: String?) -> ()){
        Auth.auth().signIn(withEmail: email, password: password, completion: {(userData, error) in
            if let actualError = error {
                // Error
                setEmailPassword(email: email, password: password)
                completion(actualError.localizedDescription)
            }
            else {
                // No Error
                completion(nil)
            }
        })
    }
    
    class func signOutActiveUser(with_completion completion: (_ error: Bool) -> ()) {
        do {
            try Auth.auth().signOut()
            setEmailPassword(email: nil, password: nil)
            completion(false)
        }
        catch {
            completion(true)
        }
    }
    
    private class func setEmailPassword(email: String?, password: String?) {
        UserDefaults.standard.set(email, forKey: EMAIL)
        UserDefaults.standard.set(password, forKey: PASSWORD)
    }
    
    class func getSignedInEmailPassword() -> (email : String, password : String)? {
        if let email = UserDefaults.standard.value(forKey: EMAIL), let password = UserDefaults.standard.value(forKey: PASSWORD) {
            return ((email : email, password : password) as! (email: String, password: String))
        }
        else {
            return nil
        }
    }
    
    class func addUser(user: User, ref: DatabaseReference ,with_completion completion: (_ error: Bool) -> ()) {
        ref.observe(.value, with: {(snapshot) in
            
        })
    }
}
