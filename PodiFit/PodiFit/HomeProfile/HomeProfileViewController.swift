//
//  HomeProfileViewController.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 22/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import UserNotifications

class HomeProfileViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var completedData = [CompletedPlanModel]()
    var reminderData = [ReminderModel]()
    
    var addButton = UIButton()
    
    var counter: Int = 0
    
    var reminderNameArray: [String] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 5 nanti bikin jadi 5 setelah semua cellnya jadi
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        else if section == 1{
            return 1
        }
        else if section == 2
        {
            return 1
        }
        else if section == 3
        {
            return reminderData.count
        }
        else
       {
           return 1
       }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 110
        }
        else if indexPath.section == 1
        {
            return 140
        }
        else if indexPath.section == 2
        {
            return 152
        }
        else if indexPath.section == 3
        {
            return 90
        }
        else
        {
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0
        {
             let cell = tableView.dequeueReusableCell(withIdentifier: "imagePersonCell", for: indexPath) as! imagePersonTableViewCell
            
            cell.persomImage.image = UIImage(systemName: "folder")
            
            return cell
            
        }
        else if indexPath.section == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "userDataCell", for: indexPath) as! userDataTableViewCell
            
            //nanti ganti dengan input user
            cell.numberOfActivePlansLabel.text = "0"
            cell.numberWeightLabel.text = "0"
            cell.heightLabel.text = "0"
            
            return cell
            
            
        }
        else if indexPath.section == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "completedPlanCell", for: indexPath) as! CompletedPlanTableViewCell
            
            cell.loadCollectionView(data: completedData)
            
            return cell
        }
        else if indexPath.section == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as! ReminderTableViewCell
            
            cell.hourLabel.text = reminderData[indexPath.row].Hour
            cell.reminderNameLabel.text = reminderData[indexPath.row].reminderName
            
            if reminderData[indexPath.row].isMon == true {
                cell.mondayLabel.textColor = .black
            }
            else
            {
                cell.mondayLabel.textColor = .gray
            }
            
             if reminderData[indexPath.row].isTue == true {
                cell.TuesdayLabel.textColor = .black
            }
            else
           {
               cell.TuesdayLabel.textColor = .gray
           }
            if reminderData[indexPath.row].isWed == true {
                cell.wednesdayLabel.textColor = .black
               }
            else
           {
               cell.wednesdayLabel.textColor = .gray
           }
             if reminderData[indexPath.row].isThu == true {
                cell.thursdayLabel.textColor = .black
               }
            else
           {
               cell.thursdayLabel.textColor = .gray
           }
            if reminderData[indexPath.row].isFri == true {
                cell.fridayLabel.textColor = .black
               }
            else
           {
               cell.fridayLabel.textColor = .gray
           }
             if reminderData[indexPath.row].isSat == true {
                cell.saturdayLabel.textColor = .black
               }
            else
               {
                   cell.saturdayLabel.textColor = .gray
               }
             if reminderData[indexPath.row].isSun == true {
                cell.sundayLabel.textColor = .black
               }
            else
               {
                   cell.sundayLabel.textColor = .gray
               }
            
            if reminderData[indexPath.row].isReminderActive == true {
                cell.reminderSwitch.setOn(true, animated: false)
            }
            else
            {
                cell.reminderSwitch.setOn(false, animated: false)
            }
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as! ReminderTableViewCell
            
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0
        {
            return ""
        }
        else if section == 1
        {
            return ""
        }
        else if section == 2 {
            return "Completed Plan"
        }
        else if section == 3
        {
            return "Reminder"
        }
        else if section == 4
        {
            return "badges"
        }
        else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           
        let headerView = UIView()
        
        if section == 2 || section == 3
        {
             headerView.backgroundColor = UIColor.white

             let sectionLabel = UILabel(frame: CGRect(x: 20, y: 10, width:
             tableView.bounds.size.width, height: tableView.bounds.size.height))
             sectionLabel.font = UIFont(name: "Helvetica", size: 20)
             sectionLabel.font = UIFont.boldSystemFont(ofSize: 20)
             sectionLabel.textColor = UIColor.black
  
            addButton = UIButton(frame: CGRect(x: tableView.frame.size.width - 100, y: 5, width:
            80, height: 33))
            addButton.titleLabel?.textColor = .gray
            
            if section == 2 {
                 sectionLabel.text = "Completed Plan"
                addButton.setTitle("History", for: .normal)
                addButton.setTitleColor(.gray, for: .normal)
                
                addButton.addTarget(self, action: #selector(completeButtonPressed), for: .touchUpInside)
            }
            if section == 3
            {
               addButton.setTitle("Add new", for: .normal)
               addButton.setTitleColor(.gray, for: .normal)
               addButton.addTarget(self, action: #selector(reminderButtonPressed), for: .touchUpInside)
                sectionLabel.text = "Reminder"
            }
          
             sectionLabel.sizeToFit()
            
            headerView.addSubview(sectionLabel)
            headerView.addSubview(addButton)
        
             return headerView
        }
            return headerView
       }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        if indexPath.section == 3
        {
            let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed: (Bool)-> ()) in
                
                
                self.performSegue(withIdentifier: "toEditReminder", sender:nil)
                actionPerformed(true)
            }
            
            let delete = UIContextualAction(style: .normal, title: "Delete") { (contextualAction, view, actionPerformed: (Bool)-> ()) in
                self.counter = 0
                
                if self.reminderData[indexPath.row].isMon == true
                {
                    self.counter += 1
                }
                if self.reminderData[indexPath.row].isTue == true
                  {
                      self.counter += 1
                  }
                if self.reminderData[indexPath.row].isWed == true
                  {
                      self.counter += 1
                  }
                if self.reminderData[indexPath.row].isThu == true
                  {
                      self.counter += 1
                  }
                if self.reminderData[indexPath.row].isFri == true
                  {
                      self.counter += 1
                  }
                if self.reminderData[indexPath.row].isSat == true
                  {
                      self.counter += 1
                  }
                if self.reminderData[indexPath.row].isSun == true
                  {
                      self.counter += 1
                  }
                
                for i in 0...self.counter - 1
                {
                  self.reminderNameArray.append("\(self.reminderData[indexPath.row].reminderName!)\(i)")
                }
                  
                for _ in 0...self.reminderNameArray.count - 1
                {
                    notifHelper.notificationCenter.removeDeliveredNotifications(withIdentifiers: self.reminderNameArray)
                    notifHelper.notificationCenter.removePendingNotificationRequests(withIdentifiers: self.reminderNameArray)
                    
                }
            
                notifHelper.deleteDataInReminder(uniqueReminderName: self.reminderData[indexPath.row].reminderName)
                self.reminderData.remove(at: indexPath.row)
                self.completeRemindBadgeTableView.reloadData()
                
                actionPerformed(true)
            }
            
            edit.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
            delete.backgroundColor = .gray
            
            return UISwipeActionsConfiguration(actions: [delete,edit])
            
        }
        return nil
        
    }
        
    @objc func completeButtonPressed()
    {
        print("pressed complete button")
        performSegue(withIdentifier: "toCompletedHistory", sender: self)
    }
    @objc func reminderButtonPressed()
   {
        print("pressed reminder button")
       performSegue(withIdentifier: "toAddReminder", sender: self)
   }
    
    override func viewWillAppear(_ animated: Bool) {
        reminderData = notifHelper.retrieveNotificationFromCoreData()
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
       
    }
    
    @IBAction func unwindSegueFromAddReminder(sender: UIStoryboardSegue){
           reminderData = notifHelper.retrieveNotificationFromCoreData()
            completeRemindBadgeTableView.reloadData()
          
       }
    

    @IBOutlet weak var completeRemindBadgeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        completeRemindBadgeTableView.delegate = self
        completeRemindBadgeTableView.dataSource = self
        
        completeRemindBadgeTableView.separatorStyle = .none
        
        //self.view.backgroundColor = .black
      //  self.completeRemindBadgeTableView.backgroundColor = .none
        
        notifHelper.configureUserNotificationCenter()
        //notifHelper.deleteDataInReminder(uniqueReminderName: "Loni")
        //notifHelper.notificationCenter.removeAllDeliveredNotifications()
        //notifHelper.notificationCenter.removeAllPendingNotificationRequests()
        
        //data dummy buat completedData
        self.completedData =
            [
                CompletedPlanModel(titleMovement: "Leg Plan", level: "Beginner", period: 4, movement: 5)
                ,CompletedPlanModel(titleMovement: "Advance leg plan", level: "Intermediate", period: 6, movement: 8)
                
            ]
    }
    
}

extension HomeProfileViewController: editButtonProtocol
{
    func moveToEditPage() {
        performSegue(withIdentifier: "toEditProfile", sender: self)
    }
    
    
}




