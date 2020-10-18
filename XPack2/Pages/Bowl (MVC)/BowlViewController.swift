//
//  BowlViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlViewController: UIViewController {
    var bowl: Bowl = Bowl.dataMock
    
    
    @IBOutlet weak var bowlView : BowlView!
    var bowlIngredients: [IngredientType] = IngredientType.allCases
    
    var customer: Customer = Customer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bowlView.bowlContentTableView?.delegate = self
        bowlView.bowlContentTableView?.dataSource = self
        
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
            dest.ingredientDesc = bowlIngredients[ip.row]
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
        cell.setupCellFor(bowl: bowl, type: bowlIngredients[indexPath.row])
        return cell
    }
    
    // table view on tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "IngridientChoiceSegue", sender: indexPath)
    }
}
