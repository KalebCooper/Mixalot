//
//  IngredientsVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/4/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit

class IngredientsVC: UIViewController {
    
    var gradientLayer: CAGradientLayer!
    var ingredient: String!
    var image: UIImage!

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBAction func addAction(_ sender: Any) {
        
        
        
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
