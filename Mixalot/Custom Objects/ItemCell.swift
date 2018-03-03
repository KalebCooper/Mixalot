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
    @IBOutlet weak var heartOutlet: DOFavoriteButton!
    @IBOutlet weak var favoriteNumberOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //heartOutlet.addTarget(self, action: Selector("tapped:"), for: .touchUpInside)
        heartOutlet.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func tapped(sender: DOFavoriteButton) {

        print("Tapped")
        
    }

    

}
