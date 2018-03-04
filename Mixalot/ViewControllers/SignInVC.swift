//
//  SignInVC.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func testSignIn() {
        FBDatabase.signIn(email: "user4@gmail.com", password: "password", with_completion: {(id, error) in
            if let actualError = error {
                print(actualError)
            }
            else {
                print("Signed in User")
                let ref = Database.database().reference()
                FBDatabase.getUser(with_id: id!, ref: ref, with_completion: {(user) in
                    if let activeUser = user {
                        print("Got activeUser")
                        FBDatabase.signOutActiveUser(with_completion: {(error) in
                            if !error {
                                print("Sign out succsesful")
                            }
                            else {
                                print("Did not sign out")
                            }
                        })
                    }
                    else {
                        print("Did not get user")
                    }
                })
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Outlet Actions
    
    @IBAction func createAccountPressed(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
