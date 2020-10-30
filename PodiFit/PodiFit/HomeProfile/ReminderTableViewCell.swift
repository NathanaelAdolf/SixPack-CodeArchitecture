//
//  ReminderTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var reminderNameLabel: UILabel!
    
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var TuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saturdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!
    
    @IBOutlet weak var reminderSwitch: UISwitch!
    
    @IBOutlet var backgroundViewReminder: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        self.backgroundViewReminder.layer.cornerRadius = 5
        self.backgroundViewReminder.backgroundColor = .lightGray
        self.backgroundColor = .none
        
        mondayLabel.textColor = .gray
         TuesdayLabel.textColor = .gray
         wednesdayLabel.textColor = .gray
         thursdayLabel.textColor = .gray
         fridayLabel.textColor = .gray
         saturdayLabel.textColor = .gray
         sundayLabel.textColor = .gray
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
