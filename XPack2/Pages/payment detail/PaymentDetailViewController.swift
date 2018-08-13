//
//  PaymentDetailViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 11/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit
import CoreData

class PaymentDetailViewController: UIViewController {
    
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet weak var userIdTextField: UITextField!
    
    var bowl = Bowl()
    var bank = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLable.text = "\(bowl.price).000"
        bankLabel.text = bank
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToFinishPayment(_ sender: Any) {
        self.saveOrder()
        performSegue(withIdentifier: "FinishOrderSegue", sender: nil)
    }
    
    private func saveOrder(){
        let moc = CoreDataHelper().objectContext()
        
        let request: NSFetchRequest<Order> = Order.fetchRequest()
        do{
            let orders = try moc.fetch(request) as [Order]
            
            for order in orders{
                moc.delete(order)
            }
            try moc.save()
        }catch{
            
        }
        
        

        
        
        
        
        
        
        
        let newOrder = Order(context: moc)
        newOrder.timestamp = Date()
        newOrder.bowl = bowl
        
        do{
            try moc.save()
        }catch{
            //This should never happen
            //One of the reason could be:
            //- Out of memory
            //- System failure
            //- Directory not found
            //- Model object deleted
            
            fatalError("Fail to save the data")
        }
        
        
        
    }
    
}
