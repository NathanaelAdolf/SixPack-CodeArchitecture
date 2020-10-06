//
//  ViewController.swift
//  XPack2
//
//  Created by Jazilul Athoya on 06/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class CustomerInformationViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupXPackNavigationBarFor(title: "Order")
        
    }

    @IBAction func goToBowlPage(_ sender: Any) {
        
        if nameTextField.text! == "" {
            showAlertMessage()
        }
        
        performSegue(withIdentifier: "GoToBowlPage", sender: Customer(name: nameTextField.text! , email: emailTextField.text!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? BowlViewController {
            dest.customer = sender as! Customer
        }
    }
    
    func showAlertMessage(){
        // create the alert
        let alert = UIAlertController(title: "Notice", message: "Please fill your name", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

    }
    
}

