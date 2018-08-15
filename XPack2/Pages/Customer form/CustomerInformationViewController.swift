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
        self.detectAdaptiveClass(title: "Order")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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
        let alert = UIAlertController(title: "Notice", message: "Please fill your name", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

    }
    
    @IBAction func unwindToCustomerDetail(_ sender: UIStoryboardSegue) {
        let sourceViewController = sender.source
        // Use data from the view controller which initiated the unwind segue
    }
    
}

