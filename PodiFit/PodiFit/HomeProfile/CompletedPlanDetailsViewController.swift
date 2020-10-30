//
//  CompletedPlanDetailsViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 30/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class CompletedPlanDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var planDetailsData = [CompletedPlanDetailModel]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planDetailsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedPlanDetailCell")as! CompletedPlanDetailTableViewCell
        
        cell.titlePlanLabel.text = planDetailsData[indexPath.row].titleMovement
        cell.numberWeeksLabel.text = String(planDetailsData[indexPath.row].numberWeeks)
        cell.numberExerciseLabel.text = String(planDetailsData[indexPath.row].numberExercise)
        cell.planImage.image = UIImage(named: planDetailsData[indexPath.row].imagePlan)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    

    @IBOutlet var completedPlanDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completedPlanDetailTableView.delegate = self
        completedPlanDetailTableView.dataSource = self
        
        //data dummy buat plan details
        planDetailsData = [CompletedPlanDetailModel(titleMovement: "Easy Leg Plan", numberWeeks: 3, numberExercise: 4, imagePlan: "LegPlanImage.png"),CompletedPlanDetailModel(titleMovement: "Easy Leg Plan", numberWeeks: 3, numberExercise: 4, imagePlan: "LegPlanImage.png"),CompletedPlanDetailModel(titleMovement: "Easy Leg Plan", numberWeeks: 3, numberExercise: 4, imagePlan: "LegPlanImage.png")]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.tabBarController?.tabBar.isHidden = true
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
