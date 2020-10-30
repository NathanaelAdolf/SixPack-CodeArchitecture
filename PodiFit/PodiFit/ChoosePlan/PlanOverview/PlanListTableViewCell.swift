//
//  PlanListTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class PlanListTableViewCell: UITableViewCell {

    @IBOutlet weak var planImage: UIImageView!
    @IBOutlet weak var planName: UILabel!
    @IBOutlet weak var planSubtitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
