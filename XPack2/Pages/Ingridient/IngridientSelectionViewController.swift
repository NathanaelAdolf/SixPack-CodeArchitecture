//
//  IngridientSelectionViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class IngridientSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, IngridientCellProtocol {
    
    @IBOutlet weak var ingridientTableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    
    var ingredients: [String] = []
    var ingredientType: IngredientType = .base
    var bowl: Bowl = Bowl()
    var selectedIngredients: [String:Double] = [:]
    var isChargedForAdditionalServing = false
    var additionalCharge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch ingredientType {
        case .base:
            ingredients = IngredientData().bases
        case .protein:
            ingredients = IngredientData().proteins
        case .supplement:
            ingredients = IngredientData().supplemets
        case .topping:
            ingredients = IngredientData().toppings
        case .dressing:
            ingredients = IngredientData().dressings
        }
        
        title = ingredientType.rawValue.capitalized
        
        if bowl.ingredients[ingredientType] != nil {
            selectedIngredients = bowl.ingredients[ingredientType]!
        }
        
        ingridientTableView.delegate = self
        ingridientTableView.dataSource = self
        
        updatePriceBarItem()
        
        (isChargedForAdditionalServing, additionalCharge) = bowl.isChargedForAdditionalServing(type: ingredientType)
    }
    
    func updatePriceBarItem(){
        priceLabel.text = "\(bowl.price)K"
    }
    
    // detect whether view contoller will disappear
    override func viewWillDisappear(_ animated: Bool) {
        if let dest = self.navigationController?.topViewController as? BowlViewController {
            performSegue(withIdentifier: "unwindToBowlPage", sender: self)
        }
    }
}

// Extensiom Table View
extension IngridientSelectionViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngridientCell", for: indexPath) as! IngridientTableViewCell
        
        let ingredientName = ingredients[indexPath.row]
        
        cell.cellProtocol = self
        
        if let image = UIImage(named: ingredientName){
            cell.ingredientImageView.image = image
        }
        
        if let additionalPrice = IngredientData().additionalPrice[ingredientName] {
            cell.ingridientNameLabel.text = "\(ingredientName) (+\(additionalPrice)K)"
        } else {
            cell.ingridientNameLabel.text = ingredientName
        }
        
        if ingredientType == .protein {
            cell.ingridientStepper.maximumValue = 3.0
        } else {
            cell.ingridientStepper.maximumValue = 5.0
        }
        
        if let ingridientQty = selectedIngredients[ingredientName] {
            cell.ingridientStepper.value = ingridientQty
            cell.ingridientQuantityLabel.text = getDisplayedQuantityValueFromStepper(stepperValue: ingridientQty)
        } else {
            cell.ingridientStepper.value = 0.0
            cell.ingridientQuantityLabel.text = "0"
        }
        
        if isChargedForAdditionalServing {
            cell.priceLabel.text = "+\(additionalCharge)K IDR"
        } else {
            cell.priceLabel.text = "+0K IDR"
        }
        return cell
    }
}

// Extension CellProtocol
extension IngridientSelectionViewController {
    
    // return value to be displayed in the cell
    func setQuantityLabel(ingridientName: String, stepper: UIStepper) -> String {
        
        selectedIngredients[ingridientName] = stepper.value
        bowl.ingredients[ingredientType] = selectedIngredients
        updatePriceBarItem()
        
        let (isCharged, chargeAmount) = bowl.isChargedForAdditionalServing(type: ingredientType)
        if isCharged != isChargedForAdditionalServing {
            isChargedForAdditionalServing = isCharged
            additionalCharge = chargeAmount
            ingridientTableView.reloadData()
        }
        
        print(ingridientName ,stepper.value)
        return getDisplayedQuantityValueFromStepper(stepperValue: stepper.value)
    }
    
    func getDisplayedQuantityValueFromStepper(stepperValue: Double) -> String {
        if ingredientType == .protein {
            if stepperValue == 1.0 {
                return "0.5"
            } else if stepperValue > 1 {
                return "\(Int(stepperValue - 1))"
            }
        }
        return "\(Int(stepperValue))"
    }
}
