//
//  MovementCollectionViewCell.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class MovementCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movementDetails: UILabel!
    @IBOutlet weak var movementName: UILabel!
    @IBOutlet weak var movementCollectionImage: UIImageView!
    
    static let identifier = "MovementCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "MovementCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    public func configure(with model: MovementModel){
        
        self.movementName.text = model.movementName
        self.movementDetails.text = model.movementDetail
        self.movementCollectionImage.image = UIImage(named: model.movementImage)
        
        
    }
}
