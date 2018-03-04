//
//  IngredientsVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/4/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import Firebase

class IngredientsVC: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    var ingredient: String!
    var image: UIImage!

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBAction func addAction(_ sender: Any) {
        
        
        
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addToBarPressed(_ sender: Any) {
        let ref = Database.database().reference()
        let id = FBDatabase.getSignedInID()
        FBDatabase.getUser(with_id: id!, ref: ref, with_completion: {(user) in
            if let activeUser = user {
                activeUser.ingredients.append(self.ingredient)
                print("")
            }
            else {
                print("Did not get user in Ingredients VC")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if ingredient != nil {
            createGradientLayer()
            setup()
        }
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        titleOutlet.text = ingredient
        imageOutlet.image = image
    }

    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        let bottomColor = UIColor(displayP3Red: 255/255, green: 47/255, blue: 0/255, alpha: 1).cgColor
        let topColor = UIColor(displayP3Red: 255/255, green: 136/255, blue: 74/255, alpha: 1).cgColor
        
        gradientLayer.colors = [topColor, bottomColor]
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
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
