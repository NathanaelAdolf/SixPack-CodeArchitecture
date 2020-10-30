//
//  imagePersonTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class imagePersonTableViewCell: UITableViewCell {

    @IBOutlet weak var persomImage: UIImageView!
    
     weak var buttonProtocol: editButtonProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .none
    }

    @IBAction func pressedEdit(_ sender: Any) {
        buttonProtocol?.moveToEditPage()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol editButtonProtocol: class {
    func moveToEditPage()
}
