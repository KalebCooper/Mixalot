//
//  ViewController.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*DrinkDatabase.getAlcoholicDrinks(with_completion: {(jsonObject) in
            if let json = jsonObject {
                print(json)
            }
            else {
                print("Error in view controller")
            }
        })*/
        DrinkDatabase.getDrinks(with_ingredient: "vodka", with_completion: {(json) in
            if let jsonObject = json {
                print(jsonObject)
            }
            else {
                print("Error getting drinks with ingrediants")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

