//
//  PlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

struct PlanType{
    var title = String()
    var subtitle = String()
    var image = String()
}


class PlanViewController: UITableViewController {

    var plans = [PlanType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //notifHelper.configureUserNotificationCenter()
        
        plans = [PlanType(title: "Easy Plan", subtitle: "2 weeks", image: "1"),
                 PlanType(title: "Intermediate Plan", subtitle: "4 weeks", image: "2"),
                 PlanType(title: "Advanced Plan", subtitle: "6 weeks", image: "3")]
        
        tableView.rowHeight = 200.0
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //tableView.register(PlanListTableViewCell.self, forCellReuseIdentifier: "planCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return plans.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath) as! PlanListTableViewCell

        let plan = plans[indexPath.row]
        cell.planName.text = plan.title
        cell.planSubtitle.text = plan.subtitle
        cell.planImage.image = UIImage(named: plan.image)

        return cell
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "viewPlanSegue", sender: self)
        print("selected")
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "viewPlanSegue" {
            //let dest = segue.destination as! ChoosePlanViewController
            
        }
    }
    

}
