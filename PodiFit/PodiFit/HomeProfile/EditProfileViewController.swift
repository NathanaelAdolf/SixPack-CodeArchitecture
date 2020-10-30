//
//  EditProfileViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 27/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveAction(_ sender: Any) {
        performSegue(withIdentifier: "editToProfileSegue", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
