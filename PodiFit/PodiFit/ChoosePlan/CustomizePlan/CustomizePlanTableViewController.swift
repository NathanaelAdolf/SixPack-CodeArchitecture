//
//  CustomizePlanTableViewController.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class CustomizePlanTableViewController: UITableViewController {

    var model = [MovementModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //notifHelper.configureUserNotificationCenter()

        model.append(MovementModel(movementName: "Step Up", movementImage: "1", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Glute Bridge", movementImage: "2", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Kneeling Squat", movementImage: "3", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Frog Hold", movementImage: "1", movementDetail: "20x"))
        
        model.append(MovementModel(movementName: "Frog Hold 2", movementImage: "2", movementDetail: "20x"))
        
        tableView.register(CustomizePlanTableViewCell.nib(), forCellReuseIdentifier: CustomizePlanTableViewCell.identifier)
        
        //print(model)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomizePlanTableViewCell.identifier, for: indexPath) as! CustomizePlanTableViewCell

        // Configure the cell...
        
        cell.configure(with: model)

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
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
