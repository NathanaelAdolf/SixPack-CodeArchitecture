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
    
    func setupCellFor(bowl: Bowl, type ingridientType: IngredientType)
    {
        titleLabel.text = ingridientType.rawValue.capitalized
        subtitleLabel.text = bowl.reduceIngridientStringFor(type: ingridientType)
        
        let bowlSummary = bowl.sumTotalIngredients(type: ingridientType)
        quantityLabel.text = NumberHelper().formatTruncateZeroPointDouble(for: bowlSummary)
        
    }
    //Paste step 12 Here
    
}
