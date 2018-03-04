//
//  SettingsVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/4/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let testarray = ["blue", "blueberry", "orange", "lemon", "strawberry", "lime", "cherry", "red"]
        
        imageOutlet.image = ImageSelector.selectedImage(ingredients: testarray)
        
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
