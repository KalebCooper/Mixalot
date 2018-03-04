//
//  SignInVC.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var usernameOutlet: UITextField!
    
    @IBOutlet weak var passwordOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FBDatabase.signIn(email: "user@gmail.com", password: "password", with_completion: {(error) in
            if let actualError = error {
                print(actualError)
            }
            else {
                print("Signed in User")
                FBDatabase.signOutActiveUser(with_completion: {(error) in
                    if !error {
                        print("Sign out succsesful")
                    }
                    else {
                        print("Did not sign out")
                    }
                })
            }
        })
        // Do any additional setup after loading the view.
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
