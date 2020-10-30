//
//  ChoosePlanViewController.swift
//  PodiFit
//
//  Created by Griffin on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

struct testCellData{
    var opened = Bool()
    var title = String ()
    var sectionData = [String]()
}

class ChoosePlanViewController: UITableViewController {

    var expandableData = [testCellData]()
    
    
    override func viewDidLoad() {
        expandableData = [testCellData(opened: false, title: "Week 1", sectionData: ["Push Up 1",                      "Push Up 2"]),
                          testCellData(opened: false, title: "Week 2", sectionData: ["Push Up 1", "Push Up 2"]),
                          testCellData(opened: false, title: "Week 3", sectionData: ["Push Up 1", "Push Up 2"])]
        
        super.viewDidLoad()

        //notifHelper.configureUserNotificationCenter()
        
        tableView.register(DescTableViewCell.nib(), forCellReuseIdentifier: DescTableViewCell.identifier)
        
        tableView.register(ExerciseTableViewCell.nib(), forCellReuseIdentifier: ExerciseTableViewCell.identifier)
        
        tableView.register(ButtonTableViewCell.nib(), forCellReuseIdentifier: ButtonTableViewCell.identifier)
        
        tableView.register(StackedTableViewCell.nib(), forCellReuseIdentifier: StackedTableViewCell.identifier)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell1")
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1{
            return 1
        }
        else if section == (expandableData.count + 2) {
            return 1
        }
        else{
            print("section: \(section)")
            if expandableData[section-2].opened == true {
              print("expdata count: \(expandableData[section-2].sectionData.count+1)")
                
              return expandableData[section-2].sectionData.count+1
            }
            else{
                return 1
            }
        }
    }
    /*
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        
        return label
    }
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return (expandableData.count + 3)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier, for: indexPath) as! DescTableViewCell
            cell.planDesc.text = "Action Plan"
            
            return cell
        }
        else if (indexPath.section == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier:StackedTableViewCell.identifier, for: indexPath) as! StackedTableViewCell
            
            return cell
        }
        else if (indexPath.section == (expandableData.count + 2)){
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.identifier, for: indexPath) as! ButtonTableViewCell
            
            return cell
        }
        else{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: DescTableViewCell.identifier, for: indexPath) as! DescTableViewCell
                cell.planDesc.text = expandableData[indexPath.section - 2].title
                
                return cell
            }
            else{
                let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseTableViewCell.identifier, for: indexPath) as! ExerciseTableViewCell
                cell.exerciseName.text = expandableData[indexPath.section - 2].sectionData[indexPath.row - 1]
                return cell
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("sct=\(indexPath.section) ,idx =\(indexPath.row)")
        
        //performSegue(withIdentifier: "customPlanSegue", sender: self)
        
        
        if (indexPath.section > 1 && indexPath.section < (expandableData.count + 2) && indexPath.row == 0){
            if expandableData[indexPath.section-2].opened == true{
                expandableData[indexPath.section-2].opened = false
                print("sct=\(indexPath.section) ,idx =\(indexPath.row), masuk if")
            }else{
                expandableData[indexPath.section-2].opened = true
                
                print("sct=\(indexPath.section) ,idx =\(indexPath.row), masuk else")
            }
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            //tableView.reloadData()
        }else{
            performSegue(withIdentifier: "customPlanSegue", sender: self)
        }
        
        
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
