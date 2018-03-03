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
        DrinkDatabase.getAlcoholicDrinks()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

