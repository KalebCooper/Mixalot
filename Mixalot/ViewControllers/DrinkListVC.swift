//
//  BarListCV.swift
//  Mixalot
//
//  Created by Jackson Delametter on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import Firebase

class DrinkListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    private var user: User!
    private var ingredientThreshold: Int!
    private var drinks: [Drink]!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func refreshAction(_ sender: Any) {
        
        filterDrinks()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //testSingleDrink()
        setup()
        //getDrinkIDs()
        //testAPIFilter()
        //testSingleQuery()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    private func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        ingredientThreshold = 3
        drinks = []
        let ref = Database.database().reference()
        guard let id = FBDatabase.getSignedInID() else {
            return
        }
        FBDatabase.getUser(with_id: id, ref: ref, with_completion: {(user) in
            if let activeUser = user {
                self.user = activeUser
                self.filterDrinks()
            }
            else {
                print("Could not get user in DrinkList VC")
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return drinks.count
    }
    
//    private func filterDrinksThreading(_ completionBLock: @escaping (_ success: Bool, _ error: NSError?) -> ()) {
//
//
//
//
//    }
    
    private func filterDrinks() {
        
        DispatchQueue.main.async {
            
            self.drinks = []
        var previousQueriedDrinkIDs: [String] = []
        var filteredQueriedDrinkIDs: [String] = []
        var ingredCount = 0
        print("Started")
            for ingredient in self.user.ingredients {
            ingredCount = ingredCount + 1
                if ingredCount > self.ingredientThreshold {
                break
            }
            if let jsonObjects = DrinkDatabase.getDrinks(with_ingredient: ingredient ){
                var currentDrinkIDs: [String] = []
                for jsonObject in jsonObjects {
                    if let drinkID = DrinkDatabase.getIDFromDrinkJSON(json: jsonObject) {
                        //print(drinkID)
                        currentDrinkIDs.append(drinkID)
                    }
                }
                //print("There are \(currentDrinkIDs.count) new ids")
                if previousQueriedDrinkIDs.count != 0 {
                    // There have been previous queries
                    for currentID in currentDrinkIDs {
                        if previousQueriedDrinkIDs.contains(currentID) {
                            // If the currentID was found in the previous query
                            // Add it to the new list of ids
                            filteredQueriedDrinkIDs.append(currentID)
                        }
                    }
                    previousQueriedDrinkIDs = filteredQueriedDrinkIDs
                    filteredQueriedDrinkIDs.removeAll()
                    //print("There are now \(previousQueriedDrinkIDs.count) filtered ids")
                }
                else {
                    // There have not been any previous queries
                    previousQueriedDrinkIDs = currentDrinkIDs
                }
            }
            else {
                // Drink does not include this ingredient
                previousQueriedDrinkIDs = []
                break
            }
        }
        for previousID in previousQueriedDrinkIDs {
            print(previousID)
        }
        print("Ended")
            self.loadDrinks(drinkIDs: previousQueriedDrinkIDs)
        }
    }
    
    private func loadDrinks(drinkIDs: [String]) {
        for drinkID in drinkIDs {
            if let drink = DrinkDatabase.getDrink(with_id: drinkID) {
                self.drinks.append(drink)
            }
        }
        
        
            self.tableView.reloadData()
        
    }
    
    private func testSingleDrink() {
        if let drink = DrinkDatabase.getDrink(with_id: "13938") {
            print(drink.name)
        }
        else {
            print("Did not get drink")
        }
    }
    
    private func testAPIFilter() {
        let ingredients = ["Tequila", "Triple sec", "Lime juice"]
        var previousQueriedDrinkIDs: [String] = []
        var filteredQueriedDrinkIDs: [String] = []
        var ingredCount = 0
        print("Started")
        for ingredient in ingredients {
            ingredCount = ingredCount + 1
            if ingredCount > ingredientThreshold {
                break
            }
            if let jsonObjects = DrinkDatabase.getDrinks(with_ingredient: ingredient ){
                var currentDrinkIDs: [String] = []
                for jsonObject in jsonObjects {
                    if let drinkID = DrinkDatabase.getIDFromDrinkJSON(json: jsonObject) {
                        //print(drinkID)
                        currentDrinkIDs.append(drinkID)
                    }
                }
                //print("There are \(currentDrinkIDs.count) new ids")
                if previousQueriedDrinkIDs.count != 0 {
                    // There have been previous queries
                    for currentID in currentDrinkIDs {
                        if previousQueriedDrinkIDs.contains(currentID) {
                            // If the currentID was found in the previous query
                            // Add it to the new list of ids
                            filteredQueriedDrinkIDs.append(currentID)
                        }
                    }
                    previousQueriedDrinkIDs = filteredQueriedDrinkIDs
                    filteredQueriedDrinkIDs.removeAll()
                    //print("There are now \(previousQueriedDrinkIDs.count) filtered ids")
                }
                else {
                    // There have not been any previous queries
                    previousQueriedDrinkIDs = currentDrinkIDs
                }
            }
            else {
                // Drink does not include this ingredient
                previousQueriedDrinkIDs = []
                break
            }
        }
        for previousID in previousQueriedDrinkIDs {
            print(previousID)
            if let drink = DrinkDatabase.getDrink(with_id: previousID) {
                print(drink.name)
            }
            else {
                print("Did not get drink")
            }
        }
        print("Ended")
    }
    
    private func testSingleQuery() {
        if let jsonObjects = DrinkDatabase.getDrinks(with_ingredient: "Milk") {
            print(jsonObjects)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ItemCell
        let drink = self.drinks[indexPath.row]
        cell.titleOutlet.text = drink.name
        let ingredients = drink.ingredients
        cell.imageOutlet.image = ImageSelector.pickCocktailImage(title: drink.name, ingredients: ingredients!)
        if ingredients?.count == 1 {
            cell.ingred1Outlet.text = ingredients?[0]
        }
        else if ingredients?.count == 2 {
            cell.ingred1Outlet.text = ingredients![0]
            cell.ingred2Outlet.text = ingredients![1]
        }
        else if ingredients?.count == 3 {
            cell.ingred1Outlet.text = ingredients![0]
            cell.ingred2Outlet.text = ingredients![1]
            cell.ingred3Outlet.text = ingredients![2]
        }
        else {
            cell.ingred1Outlet.text = ingredients![0]
            cell.ingred2Outlet.text = ingredients![1]
            cell.ingred3Outlet.text = ingredients![2]
            cell.ingred4Outlet.text = ingredients![3]
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
