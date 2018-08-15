//
//  BowlViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var bowlContentTableView: UITableView!
    @IBOutlet weak var buildInfoLabel: UILabel!
    @IBOutlet weak var bowlTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var bowlIngredients: [IngredientType] = [.base, .protein, .supplement, .topping, .dressing]
    var bowl: Bowl = Bowl()
    var customer: Customer = Customer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bowlContentTableView.delegate = self
        bowlContentTableView.dataSource = self

        bowlContentTableView.estimatedRowHeight = 60
        bowlContentTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        refreshView()
    }
    
    
    // Unwind function to this controller
    @IBAction func unwindToBowlPage(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? IngridientSelectionViewController {
            
            bowl.ingredients[source.ingredientType] = source.selectedIngredients.filter{ $0.value > 0 }
            refreshView()
        }
        // Use data from the view controller which initiated the unwind segue
    }
    
    // Refresh the view so that match with the latest changes from ingredient
    func refreshView(){
        let (bowlTypeDescription, bowlTypeInfo) = bowl.getBowlTypeDetailInfo()

        bowlTypeLabel.text = "Hi \(customer.name),"
        buildInfoLabel.text = "You have \(bowlTypeDescription) bowl. \(bowlTypeInfo)"
        
        bowlContentTableView.reloadData()
        
        priceLabel.text = "\(bowl.price)K"
    }
    
    @IBAction func goToCheckoutPage(_ sender: Any) {
        performSegue(withIdentifier: "GoToCheckoutPage", sender: nil)
    }

    // Prepare segue for passing value to other view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? IngridientSelectionViewController {
            let ip = sender as! IndexPath
            dest.ingredientType = bowlIngredients[ip.row]
            dest.bowl = bowl
        }
        
        if let dest = segue.destination as? CheckoutViewController {
            dest.bowl = bowl
        }
    }
}

extension BowlViewController {
    
    // return row counts
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bowlIngredients.count
    }
    
    // table view mandatory delegate, return cell to be drawn
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BowlDetailCell", for: indexPath) as! BowlDetailTableViewCell
        
        // Get the Ingredient Type
        let ingredientType = bowlIngredients[indexPath.row]
        
        cell.titleLabel.text = ingredientType.rawValue.capitalized
        
        // Check if kalo ada ingredient type then write the detail on subtitle
        if bowl.ingredients[ingredientType] != nil {
            cell.subtitleLabel.text = bowl.reduceIngridientStringFor(type: ingredientType)

            let sumTotal = bowl.sumTotalIngredients(type: ingredientType)
            cell.quantityLabel.text = NumberHelper().formatTruncateZeroPointDouble(number: sumTotal)
        }
        
        return cell
    }
    
    // table view on tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "IngridientChoiceSegue", sender: indexPath)
    }
}
