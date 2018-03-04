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
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
//    var timer = Timer()
//    var i = 0
//    func scheduledTimerWithTimeInterval(){
//        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
//        timer = Timer.scheduledTimer(timeInterval: 0.08, target: self, selector: #selector(self.animatedReload), userInfo: nil, repeats: true)
//    }
//    @objc func animatedReload() {
//
//        if i < 1 {
//
//            let path = IndexPath(row: i, section: 0)
//            self.tableView.reloadRows(at: [path], with: .left)
//            i = i + 1
//            print("Reordering")
//        }
//        else{
//            timer.invalidate()
//            i = 0
//            print("Done")
//        }
//
//
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        setupSearchBar()
        
//        scheduledTimerWithTimeInterval()
//        timer.fire()
        

        
        
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.layer.transform = CATransform3DMakeScale(0.1,0.1,1)
        UIView.animate(withDuration: 0.4, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05,1.05,1)
        },completion: { finished in
            UIView.animate(withDuration: 0.4, animations: {
                cell.layer.transform = CATransform3DMakeScale(1,1,1)
            })
        })
        
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
