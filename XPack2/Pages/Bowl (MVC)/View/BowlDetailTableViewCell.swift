//
//  BowlDetailTableViewCell.swift
//  XPack2
//
//  Created by Jazilul Athoya on 08/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = XPackColours.secondary
    }
    
    //Paste step 12 Here
    
}
