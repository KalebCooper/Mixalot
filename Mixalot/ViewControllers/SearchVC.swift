//
//  SearchVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import DOFavoriteButton

class SearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        setupSearchBar()
        
        

        
        
        // Do any additional setup after loading the view.
    }

    func setupSearchBar() {
        searchBar.tintColor = UIColor.white
        searchBar.placeholder = "Search"
        searchBar.setTextColor(color: .white)
        searchBar.setPlaceholderTextColor(color: .white)
        searchBar.setSearchImageColor(color: .white)
        searchBar.setTextFieldClearButtonColor(color: .white)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ItemCell
        
        return cell
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
