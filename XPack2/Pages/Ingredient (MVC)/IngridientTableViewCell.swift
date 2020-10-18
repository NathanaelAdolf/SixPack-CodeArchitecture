//
//  IngridientTableViewCell.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class IngridientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingridientStepper: UIStepper!
    @IBOutlet weak var ingridientQuantityLabel: UILabel!
    @IBOutlet weak var ingridientNameLabel: UILabel!
    @IBOutlet weak var ingredientImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var cellProtocol: IngridientCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ingridientStepper.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        self.applyAccessibility()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func onChangeStepperValue(_ sender: Any) {
        if let qtyLabel = cellProtocol?.setQuantityLabel(ingridientName: ingridientNameLabel.text!, stepper: ingridientStepper) {
            ingridientQuantityLabel.text = qtyLabel
        }
        
    }
    
    func cellConfig(withIngredients: [String], currentIndex: Int, type: IngredientType, chargeAmount: Int, isCharge: Bool, selectedIng: [String:Double]) {
        let ingredientName = withIngredients[currentIndex]
        
        if let image = UIImage(named: ingredientName){
            ingredientImageView.image = image
            ingredientImageView.accessibilityLabel = IngredientData().imageDescription[ingredientName] ?? ingredientName
        }
        
        if let additionalPrice = IngredientData().additionalPrice[ingredientName] {
            ingridientNameLabel.text = "\(ingredientName) (+\(additionalPrice)K)"
        } else {
            ingridientNameLabel.text = ingredientName
        }
        
        if type == .protein {
            ingridientStepper.maximumValue = 3.0
        } else {
            ingridientStepper.maximumValue = 5.0
        }
        
        if let ingridientQty = selectedIng[ingredientName] {
            ingridientStepper.value = ingridientQty
            ingridientQuantityLabel.text = getDisplayedQuantityValueFromStepper(stepperValue: ingridientQty, type: type)
        } else {
            ingridientStepper.value = 0.0
            ingridientQuantityLabel.text = "0"
        }
        
        if isCharge {
            priceLabel.text = "+\(chargeAmount)K IDR"
        } else {
            priceLabel.text = "+0K IDR"
        }
    }
    
    func getDisplayedQuantityValueFromStepper(stepperValue: Double, type: IngredientType) -> String {
        if type == .protein {
            if stepperValue == 1.0 {
                return "0.5"
            } else if stepperValue > 1 {
                return "\(Int(stepperValue - 1))"
            }
        }
        return "\(Int(stepperValue))"
    }
    
}

protocol IngridientCellProtocol: class {
    func setQuantityLabel(ingridientName: String, stepper: UIStepper) -> String
}

// MARK:- Accessibility
extension IngridientTableViewCell {
    func applyAccessibility() {
        // 1. Accessibility
        self.accessibilityElements = [self.ingredientImageView, self.ingridientNameLabel, self.priceLabel, self.ingridientQuantityLabel, self.ingridientStepper]
        
        // 2. Accessibility
        self.ingredientImageView.isAccessibilityElement = true
        self.ingredientImageView.accessibilityTraits = .image
        
        self.ingridientNameLabel.font = .preferredFont(forTextStyle: .body)
        self.ingridientNameLabel.adjustsFontForContentSizeCategory = true
        
        self.priceLabel.font = .preferredFont(forTextStyle: .body)
        self.priceLabel.adjustsFontForContentSizeCategory = true
        
        self.ingridientQuantityLabel.font = .preferredFont(forTextStyle: .body)
        self.ingridientQuantityLabel.adjustsFontForContentSizeCategory = true
    }
}
