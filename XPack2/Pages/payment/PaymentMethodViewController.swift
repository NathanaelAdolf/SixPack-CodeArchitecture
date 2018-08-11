//
//  PaymentMethodViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 11/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class PaymentMethodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var paymentTableView: UITableView!
    var bankList = ["Bank BCA", "Mandiri"]
    var bowl = Bowl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentTableView.delegate = self
        paymentTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        priceLabel.text = "\(bowl.price).000"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? PaymentDetailViewController {
            dest.bowl = bowl
            
            let indexPath = sender as! IndexPath
            dest.bank = bankList[indexPath.row]
        }
    }

}

extension PaymentMethodViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bankList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentMethodCell", for: indexPath)
        cell.textLabel?.text = bankList[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PaymentDetailSegue", sender: indexPath)
    }
}
