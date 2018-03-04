//
//  ItemCell.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//
import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var ingred1Outlet: UILabel!
    @IBOutlet weak var ingred2Outlet: UILabel!
    @IBOutlet weak var ingred3Outlet: UILabel!
    @IBOutlet weak var ingred4Outlet: UILabel!
    @IBOutlet weak var favoriteNumberOutlet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let favAmount = randRange(lower: 0, upper: 107)
        favoriteNumberOutlet.text = "\(favAmount)"
        let value = randRange(lower: 0, upper: 10)
        
        
    }
    
    func randRange (lower: Int , upper: Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
    
    
}
