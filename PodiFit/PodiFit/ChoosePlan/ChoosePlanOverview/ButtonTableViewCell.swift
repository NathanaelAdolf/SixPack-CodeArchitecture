//
//  ButtonTableViewCell.swift
//  PodiFit
//
//  Created by Griffin on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    static let identifier = "ButtonTableViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ButtonTableViewCell", bundle: nil)
    }
    
    
    @IBAction func customButton(_ sender: Any) {
    }
    
    @IBAction func confirmationButton(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
