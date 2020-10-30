//
//  userDataTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class userDataTableViewCell: UITableViewCell {

    @IBOutlet weak var numberOfActivePlansLabel: UILabel!
    @IBOutlet weak var numberWeightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
