//
//  CheckoutViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 10/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var recapTableView: UITableView!
    @IBOutlet weak var packageLabel: UILabel!
    var bowl = Bowl()
    var bowlIngredients: [IngredientType] = [.base, .protein, .supplement, .topping, .dressing]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recapTableView.delegate = self
        recapTableView.dataSource = self
        
        recapTableView.estimatedRowHeight = 60
        recapTableView.rowHeight = UITableViewAutomaticDimension
    }

    // Reduce or sum all value from particular type so that we get string to display
    func reduceIngridientString(type: IngredientType, ingridients: [String:Double]) -> String {
        var tempString = ""
        var count = 0
        for ingridient in ingridients {
            count += 1
            if ingridient.value > 0.0 {
                if type == .protein {
                    if ingridient.value == 1.0 {
                        tempString.append("1/2 \(ingridient.key)")
                    } else {
                        tempString.append("\(Int(ingridient.value) - 1) \(ingridient.key)")
                    }
                } else {
                    tempString.append("\(Int(ingridient.value)) \(ingridient.key)")
                }
                
                if count < ingridients.count {
                    tempString.append(", ")
                }
            }
        }
        
        if tempString == "" {
            tempString = "Please pick your best choice"
        }
        return tempString
    }

    // Function to remove decimal di belakang kalo 0
    func formatTruncateZeroPointDouble(number: Double) -> String {
        if number.rounded(.down) == number {
            return "\(Int(number))"
        } else {
            return "\(number)"
        }
    }
}

extension CheckoutViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bowlIngredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckoutItemCell", for: indexPath) as! CheckoutItemTableViewCell
        
        // Get the Ingredient Type
        let ingredientType = bowlIngredients[indexPath.row]
        
        // Check if kalo ada ingredient type then write the detail on subtitle
        if let ingridients = bowl.ingredients[ingredientType] {
            cell.checkoutItemDescriptionLabel.text = reduceIngridientString(type: ingredientType, ingridients: ingridients)
            
            let sumTotal = bowl.sumTotalIngredients(type: ingredientType)
            cell.quantityLabel.text = formatTruncateZeroPointDouble(number: sumTotal)
        }
        
        return cell
    }
}
