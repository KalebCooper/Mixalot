//
//  ItemCell.swift
//  Mixalot
//
//  Created by Kaleb Cooper on 3/3/18.
//  Copyright © 2018 Kaleb Cooper. All rights reserved.
//

import UIKit
import DOFavoriteButton

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var titleOutlet: UILabel!
    @IBOutlet weak var ingred1Outlet: UILabel!
    @IBOutlet weak var ingred2Outlet: UILabel!
    @IBOutlet weak var ingred3Outlet: UILabel!
    @IBOutlet weak var ingred4Outlet: UILabel!
    @IBOutlet weak var favoriteNumberOutlet: UILabel!
    //@IBOutlet weak var heartButton: DOFavoriteButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        heartButton.imageColorOn = UIColor(red: 254/255, green: 110/255, blue: 111/255, alpha: 1.0)
//        heartButton.circleColor = UIColor(red: 254/255, green: 110/255, blue: 111/255, alpha: 1.0)
//        heartButton.lineColor = UIColor(red: 226/255, green: 96/255, blue: 96/255, alpha: 1.0)
//        heartButton.addTarget(self, action: #selector(self.tappedButton), for: .touchDown)
        
        //heartOutlet.addTarget(self, action: Selector("tapped:"), for: .touchUpInside)
        //heartOutlet.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func tappedButton(sender: DOFavoriteButton) {
        if sender.isSelected {
            sender.deselect()
        } else {
            sender.select()
        }
    }
    
    
    
    
}

