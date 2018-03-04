//
//  SearchVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import DOFavoriteButton
import Firebase

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    // MARK: - Properties
    private var ingredientsDrinks: [Any]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideKeyboard()
        print("Called")
        setupSearchBar()
        setup()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func setupSearchBar() {
        searchBar.tintColor = UIColor.white
        searchBar.placeholder = "Search for ingredients or drinks"
        searchBar.setTextColor(color: .white)
        searchBar.setPlaceholderTextColor(color: .white)
        searchBar.setSearchImageColor(color: .white)
        searchBar.setTextFieldClearButtonColor(color: .white)
    }
    
    private func setup() {
        ingredientsDrinks = []
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        if let ingredients = DrinkDatabase.getIngredients() {
            for ingredient in ingredients {
                print(ingredient)
                ingredientsDrinks.append(ingredient)
            }
            self.tableView.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsDrinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ItemCell
        let ingredientOrDrink = ingredientsDrinks[indexPath.row]
        if let ingredient = ingredientOrDrink as? String {
            cell.titleOutlet.text = ingredient
            cell.imageOutlet.image = ImageSelector.pickIngredientImage(title: ingredient)
        }
        else if let drink = ingredientOrDrink as? Drink {
            cell.titleOutlet.text = drink.name
            cell.ingred1Outlet.text = drink.ingredients[0]
            cell.ingred2Outlet.text = drink.ingredients[1]
            cell.ingred3Outlet.text = drink.ingredients[2]
            cell.ingred4Outlet.text = drink.ingredients[3]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Called")
        let cell = tableView.cellForRow(at: indexPath) as! ItemCell
        let cellData = ingredientsDrinks[indexPath.row]
        if let ingredient = cellData as? String {
            let infoArray = [cell.imageOutlet.image, ingredient] as [Any]
            self.performSegue(withIdentifier: "IngredientSegue", sender: infoArray)
        }
        else if let drink = cellData as? Drink {
            let infoArray = [cell.imageOutlet.image, drink] as [Any]
            self.performSegue(withIdentifier: "DrinkSegue", sender: infoArray)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.1, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.15, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
        
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let segueID = segue.identifier
        let infoArray = sender as! [Any]
        if segueID == "IngredientSegue" {
            let destination = segue.destination as! IngredientsVC
            destination.image = infoArray[0] as! UIImage
            destination.ingredient = infoArray[1] as! String
        }
        else if segueID == "DrinkSegue" {
            
        }
    }
    

}
