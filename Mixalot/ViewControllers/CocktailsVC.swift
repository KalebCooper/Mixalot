//
//  CocktailsVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/4/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import Firebase

class CocktailsVC: UITableViewController {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var favoriteOutlet: UIButton!
    @IBOutlet weak var ingredientsTable: UITableView!
    @IBOutlet weak var instructionsOutlet: UITextView!
    
    
    @IBAction func favoriteAction(_ sender: Any) {
    }
    
    
    var gradientLayer: CAGradientLayer!
    var ingredients: [String] = []
    //var ingredientsSize: [String] = []
    
    var drink: Drink!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if drink != nil {
            //createGradientLayer()
            setupCocktail()
        }
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func setupCocktail() {
        
        ingredientsTable.delegate = self
        ingredientsTable.dataSource = self
        
            
        titleOutlet.text = drink.name
        imageOutlet.image = image
        instructionsOutlet.text = drink.instruction
        //self.ingredients = drink.ingredients
        //self.ingredientsTable.reloadData()
        self.tableView.reloadData()
        
        
        
    }
    
    func setupGestures() {
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.tableView.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                self.dismiss(animated: true, completion: nil)
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            //self.performSegue(withIdentifier: "toCameraSegue", sender: self)
            default:
                break
            }
        }
    }
    
    func createGradientLayer() {
        gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        
        let bottomColor = UIColor(displayP3Red: 255/255, green: 47/255, blue: 0/255, alpha: 1).cgColor
        let topColor = UIColor(displayP3Red: 255/255, green: 136/255, blue: 74/255, alpha: 1).cgColor
        
        gradientLayer.colors = [topColor, bottomColor]
        
        self.tableView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if tableView == ingredientsTable {
//            return self.ingredients.count
//        }
//        else {
//            return 7
//        }
        
        return 7
    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
////
////        cell.textLabel?.text = ingredients[indexPath.row]
////        cell.textLabel?.textColor = UIColor.white
//
//        // Configure the cell...
//
//        return cell
//    }
 



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

