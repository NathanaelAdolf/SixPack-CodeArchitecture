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
    var bowl: Bowl = Bowl()
    var selectedIngredients: [String:Double] = [:]
    
    weak var ingredientsView: IngridientChoiceView!
    
    private var ingredients: [String] = []
    private var isChargedForAdditionalServing = false
    private var additionalCharge = 0
    
    override func loadView() {
        super.loadView()

        let ingView = IngridientChoiceView()
        self.view.addSubview(ingView)
        self.ingredientsView = ingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ingredientType.rawValue.capitalized
        
        if bowl.ingredients[ingredientType] != nil {
            selectedIngredients = bowl.ingredients[ingredientType]!
        }
        
        updatePriceBarItem()
        
        (isChargedForAdditionalServing, additionalCharge) = bowl.isChargedForAdditionalServing(type: ingredientType)
    }
    
    func updatePriceBarItem(){
        ingredientsView.priceLabel?.text = "\(bowl.price)K"
    }
    
    // detect whether view contoller will disappear
    override func viewWillDisappear(_ animated: Bool) {
        if let _ = self.navigationController?.topViewController as? BowlViewController {
            performSegue(withIdentifier: "unwindToBowlPage", sender: self)
        }
    }
}

// Extensiom Table View
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

extension IngridientSelectionViewController: IngridientCellProtocol {
    // return value to be displayed in the cell
    func setQuantityLabel(ingridientName: String, stepper: UIStepper) -> String {
        
        selectedIngredients[ingridientName] = stepper.value
        bowl.ingredients[ingredientType] = selectedIngredients
        updatePriceBarItem()
        
        let (isCharged, chargeAmount) = bowl.isChargedForAdditionalServing(type: ingredientType)
        if isCharged != isChargedForAdditionalServing {
            isChargedForAdditionalServing = isCharged
            additionalCharge = chargeAmount
            ingredientsView.tableView?.reloadData()
        }
        
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
