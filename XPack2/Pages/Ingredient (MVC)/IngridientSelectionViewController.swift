//
//  IngridientSelectionViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class IngridientSelectionViewController: UIViewController {
    
    var ingredientType: IngredientType = .base {
        didSet{
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
        }
    }
    
    @IBOutlet weak var ingredientsView: IngridientChoiceView!
    
    var bowl: Bowl = Bowl()
    private var selectedIngredients: [String:Double] = [:]
    private var ingredients: [String] = []
    private var isChargedForAdditionalServing = false
    private var additionalCharge = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if bowl.ingredients[ingredientType] != nil {
            selectedIngredients = bowl.ingredients[ingredientType]!
        }
        
        ingredientsView.updatePriceBarItem(price: bowl.price)
        
        (isChargedForAdditionalServing, additionalCharge) = bowl.isChargedForAdditionalServing(type: ingredientType)
    }
    
    
    // detect whether view contoller will disappear
    override func viewWillDisappear(_ animated: Bool) {
        if let _ = self.navigationController?.topViewController as? BowlViewController {
            performSegue(withIdentifier: "unwindToBowlPage", sender: self)
        }
    }
}

// MARK:- Table View Cell Base Protocol
extension IngridientSelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngridientCell", for: indexPath) as! IngridientTableViewCell
        cell.cellConfig(withIngredients: ingredients,
                        currentIndex: indexPath.row,
                        type: ingredientType,
                        chargeAmount: self.additionalCharge,
                        isCharge: isChargedForAdditionalServing,
                        selectedIng: selectedIngredients)
        cell.cellProtocol = self
        return cell
    }
}


// MARK:- Table View Cell Ingredient Protocol
extension IngridientSelectionViewController: IngridientCellProtocol {
    // return value to be displayed in the cell
    func setQuantityLabel(ingridientName: String, stepper: UIStepper) -> String {
        
        selectedIngredients[ingridientName] = stepper.value
        bowl.ingredients[ingredientType] = selectedIngredients
        ingredientsView.updatePriceBarItem(price: bowl.price)
        
        let (isCharged, chargeAmount) = bowl.isChargedForAdditionalServing(type: ingredientType)
        if isCharged != isChargedForAdditionalServing {
            isChargedForAdditionalServing = isCharged
            additionalCharge = chargeAmount
            ingredientsView.tableView?.reloadData()
        }
        
        return getDisplayedQuantityValueFromStepper(value: stepper.value,for: ingredientType)
    }
}



// MARK:- Page Business Logic - This is Testable
extension IngridientSelectionViewController{
    func getDisplayedQuantityValueFromStepper(value: Double,for ingredientType: IngredientType) -> String {
        if ingredientType == .protein {
            if value == 1.0 {
                return "0.5"
            } else if value > 1 {
                return "\(Int(value - 1))"
            }
        }
        return "\(Int(value))"
    }
}
