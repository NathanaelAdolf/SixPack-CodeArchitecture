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
    
    func setupCellFor(bowl: Bowl, type ingredientType: IngredientType){
        if bowl.ingredients[ingredientType] != nil {
            titleLabel.text = ingredientType.rawValue.capitalized
            subtitleLabel.text = bowl.reduceIngridientStringFor(type: ingredientType)
            quantityLabel.text = NumberHelper().formatTruncateZeroPointDouble(number: bowl.sumTotalIngredients(type: ingredientType))
        }
        applyAccessibility()
    }
}

//MARK: Accessibiity
extension BowlDetailTableViewCell {
    func applyAccessibility() {
        titleLabel.font = .preferredFont(forTextStyle: .body)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        subtitleLabel.font = .preferredFont(forTextStyle: .body)
        subtitleLabel.adjustsFontForContentSizeCategory = true
        
        quantityLabel.font = .preferredFont(forTextStyle: .body)
        quantityLabel.adjustsFontForContentSizeCategory = true
        quantityLabel.accessibilityLabel = "\(quantityLabel.text!) detail item in this menu"
    }
}

