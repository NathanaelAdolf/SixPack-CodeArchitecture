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

    @IBOutlet weak var bowlTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recapTableView.delegate = self
        recapTableView.dataSource = self
        
        recapTableView.estimatedRowHeight = 60
        recapTableView.rowHeight = UITableViewAutomaticDimension
        
        priceLabel.text = "IDR \(bowl.price)K"
        
        let (bowlType, _) = bowl.getBowlTypeDetailInfo()
        bowlTypeLabel.text = bowlType.uppercased()
        
        title = "Checkout"
    }
    
    @IBAction func goToPaymentMethodPage(_ sender: Any) {
        performSegue(withIdentifier: "PaymentMethodSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PaymentMethodViewController {
            dest.bowl = bowl
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
        if bowl.ingredients[ingredientType] != nil {
            cell.checkoutItemDescriptionLabel.text = bowl.reduceIngridientStringFor(type: ingredientType)
            
            let sumTotal = bowl.sumTotalIngredients(type: ingredientType)
            cell.quantityLabel.text = NumberHelper().formatTruncateZeroPointDouble(number: sumTotal)
        }
        
        return cell
    }
}
