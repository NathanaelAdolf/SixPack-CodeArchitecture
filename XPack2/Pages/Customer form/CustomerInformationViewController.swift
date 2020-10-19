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
    
    
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupXPackNavigationBarFor(title: "Order")
        
        //accessibility warning dynamic text handling
        nameTextField.font = .preferredFont(forTextStyle: .body)
        nameTextField.adjustsFontForContentSizeCategory = true
        
        emailTextField.font = .preferredFont(forTextStyle: .body)
        emailTextField.adjustsFontForContentSizeCategory = true
        
        orderButton.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        orderButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        //accessibility hit area is to small
        emailTextField.accessibilityFrame.size.height = 45
        
        //handling contrast ratio
        let titleContrastColor = UIColor.init(red: 69/255, green: 69/255, blue: 69/255, alpha: 1.0)
        
        //get navigation bar instance
        let navBar = self.navigationController?.navigationBar
        
        //set the attribute
        navBar?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleContrastColor]
        
        //handling to potential inaccessible
        nameTextField.isAccessibilityElement = true
        nameTextField.accessibilityLabel = "Input Name"
        
        emailTextField.isAccessibilityElement = true
        emailTextField.accessibilityLabel = "Input email"
        
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

