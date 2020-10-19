//
//  BowlViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 07/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlViewController: UIViewController {
    
    @IBOutlet weak var bowlView: BowlView!
    
    var bowl: Bowl = Bowl.dataMock
    var customer: Customer = Customer()
    var bowlIngridients: [IngredientType] = IngredientType.allCases
    
    var chosenIngredientType: IngredientType!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setup view
        
        bowlView.bowlContentTableView.delegate = self
        bowlView.bowlContentTableView.dataSource = self
        
        bowlView.setView(with: customer, bowl: bowl)
    }
    // Paste step 9 Here
    
    
    // Paste step 4 Here
    
    
    // Paste step 5 Here
    
}

//Paste step 11 here

extension BowlViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bowlIngridients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //define cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "BowlDetailCell", for: indexPath) as! BowlDetailTableViewCell
        //tell the cell what to do
        cell.setupCellFor(bowl: bowl, type: bowlIngridients[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenIngredientType = bowlIngridients[indexPath.row]
        
        performSegue(withIdentifier: "goToDetail", sender: self)
            
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! IngridientSelectionViewController
        nextVC.bowl = bowl
        nextVC.ingredientType = chosenIngredientType!
    }
    
    
}


