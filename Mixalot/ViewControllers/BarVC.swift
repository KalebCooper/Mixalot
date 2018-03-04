//
//  BarVC.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/4/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import Firebase


class BarVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var ingredientsList: [String]!
    var user: User!
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setup()
        
    }
    
    func setup(){
        
        ingredientsList = []
        
        let ref = Database.database().reference()
        let id = FBDatabase.getSignedInID()
        FBDatabase.getUser(with_id: id!, ref: ref, with_completion: {(user) in
            if let actualUser = user {
                self.user = actualUser
                self.ingredientsList = self.user.ingredients
                print(self.ingredientsList)
                print(self.ingredientsList.count)
                self.collectionView.reloadData()
                ref.removeAllObservers()
            }
            else {
                print("Did not get user in ingredient VC")
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ingredientsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print("Entering cellForItemAt")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! BarCell
    
        let title = "\(ingredientsList[indexPath.row])"
        cell.titleOutlet.text = title
        cell.imageOutlet.image = ImageSelector.pickIngredientImage(title: title)
        
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        })
        
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
