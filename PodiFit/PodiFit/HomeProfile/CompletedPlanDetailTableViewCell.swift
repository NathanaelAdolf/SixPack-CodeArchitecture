//
//  CompletedPlanDetailTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 30/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class CompletedPlanDetailTableViewCell: UITableViewCell {

    @IBOutlet var planImage: UIImageView!
    
    @IBOutlet var titlePlanLabel: UILabel!
    @IBOutlet var numberWeeksLabel: UILabel!
    @IBOutlet var numberExerciseLabel: UILabel!
    
    @IBOutlet var completedDetailView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        completedDetailView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
