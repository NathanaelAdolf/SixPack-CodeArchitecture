//
//  RecapTableViewCell.swift
//  XPack2
//
//  Created by Jazilul Athoya on 10/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class CheckoutItemTableViewCell: UITableViewCell {

    @IBOutlet weak var checkoutItemDescriptionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
