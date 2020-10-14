//
//  BowlViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlViewController: UIViewController {
    var bowl: Bowl = Bowl()
    
    
    @IBOutlet weak var bowlView : BowlView!
    var bowlIngredients: [IngredientType] = IngredientType.allCases
    
    var customer: Customer = Customer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bowlView.bowlContentTableView?.delegate = self
        bowlView.bowlContentTableView?.dataSource = self
        
        createDataMock()
        
    }
    
    func createDataMock(){
        customer.name = "Haryanto"
        customer.email = "abcdefghijklmn@gmail.com"
        
        bowl.ingredients[IngredientType.base] = ["Brown Rice": 0.0, "Romaine Lettuce": 0.0, "Sweet Potato": 0.0, "Whole-wheat Pasta": 1.0, "Baby Spinach": 0.0, "Quinoa": 0.0]
        bowl.ingredients[IngredientType.protein] = ["Chicken Breast": 1.0, "Dory": 0.0, "Tilapia": 0.0, "Tofu": 0.0, "Rib Eye Steak": 0.0, "Salmon": 1.0]
        bowl.ingredients[IngredientType.supplement] = ["Baby Corn": 1.0, "Bell Papers": 0.0, "Broccoli": 1.0, "Butter Bean": 1.0, "Button Mushrooms": 0.0, "Carrots": 1.0, "Cherry Tomatoes": 0.0, "Couscous": 0.0, "Egg Whites": 0.0, "Kimchi": 0.0, "Onsen Egg": 0.0, "Pumpkin": 0.0, "Spicy Edamame": 0.0, "Sweet Corn": 0.0, "Wakame": 1.0, "Zucchini": 1.0, "Avocado": 1.0]
        bowl.ingredients[IngredientType.topping] = ["Almonds": 1.0, "Furikake": 0.0, "Garlic": 0.0, "Mixed Seeds": 1.0, "Raisins": 0.0, "Tortilla": 0.0]
        bowl.ingredients[IngredientType.dressing] = ["Barbeque": 1.0, "Green Curry": 1.0, "Mint Yogurt": 1.0, "Miso Mustard": 0.0, "Pesto Vinaigrette": 0.0, "Romesco": 0.0, "Sesame Peanut": 0.0, "Thai": 0.0]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bowlView.refreshView(with: customer, bowl: bowl)
    }
    
    // Unwind function to this controller
    @IBAction func unwindToBowlPage(_ sender: UIStoryboardSegue) {
        if let _ = sender.source as? IngridientSelectionViewController {
            bowlView.refreshView(with: customer, bowl: bowl)
        }
        
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

extension BowlViewController: UITableViewDelegate, UITableViewDataSource {
    
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
