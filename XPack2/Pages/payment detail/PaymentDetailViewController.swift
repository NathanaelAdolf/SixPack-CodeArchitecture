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
        //Save your order here
        let context = CoreDataHelper().objectContext()
        
        let newOrder = Order(context: context)
        
        newOrder.timestamp = Date()
        newOrder.bowl = self.bowl
        
        do{
            try context.save()
            print("successfully saving the order")
        }catch{
            print("error saving data")
        }
    }
}
