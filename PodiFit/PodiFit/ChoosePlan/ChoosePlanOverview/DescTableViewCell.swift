//
//  DescTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class DescTableViewCell: UITableViewCell {
    
    static let identifier = "DescTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "DescTableViewCell", bundle: nil)
    }

    @IBOutlet weak var planDesc: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
