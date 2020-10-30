//
//  NotificationHelper.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 25/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

class NotificationHelper: UIViewController {

    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUserNotificationCenter()
    }
    
    public func configureUserNotificationCenter()
       {
           notificationCenter.delegate = self
       }
    
    func triggerNotification()
    {
        notificationCenter.getNotificationSettings
            { (notificationSettings) in
            switch notificationSettings.authorizationStatus {
                case .notDetermined:
                    self.requestAuthorization(completionHandler: { (success) in
                        guard success else { return }
                                            print("The application is allowed to display notifications")
                    })
                case .authorized:
                                print("The application is allowed to display notifications")
                case .denied:
                                print("The application is not allowed to display notifications")
        
            case .provisional:
                 print("The application authorized to post non-interruptive user notifications")
            @unknown default:
                                print("Application Not Allowed to Display Notifications")
            }
        }
    }
    
    func scheduleNotification(reminderName: String, dateToPush: String)
    {
        print("date to push \(dateToPush)")
        //format tanggal seperti di dateFormatterGet
           let dateFormatterGet = DateFormatter()
           dateFormatterGet.dateFormat = "EEEE HH:mm:ss"
           
            //step 2 : create the notification content
            let content = UNMutableNotificationContent()
                content.title = "Reminder"
                content.body = "don't forget to workout today"

            // step 3 : create the notification trigger
          let date = dateFormatterGet.date(from: dateToPush)
           
           let dateComponents = Calendar.current.dateComponents([.weekday,.hour,.minute,.second], from: date!)
           let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
            //step 4 : create the request
                let request = UNNotificationRequest(identifier: reminderName, content: content, trigger: trigger)

            // step 5 : register the request
                notificationCenter.add(request) { (error) in
                   
                }
        print("success")
    }
    
    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
        // Request Authorization
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (success, error) in
            if let error = error {
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }
            completionHandler(success)
        }
    }
    
    func storeNotificationToCoreData(reminderName: String,hour: String,minute: String, monday: Bool, tuesday: Bool, wednesday: Bool, thursday: Bool, friday: Bool, saturday: Bool,sunday: Bool, isReminderActive: Bool)->String
    {
      
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return ""}
    
          var message: String = ""

          let context = appDelegate.persistentContainer.viewContext

          let dataOfEntity = NSEntityDescription.entity(forEntityName: "Reminder", in: context)!
          let listOfEntity = NSManagedObject(entity: dataOfEntity, insertInto: context)

         listOfEntity.setValue(hour, forKey: "hour")
         listOfEntity.setValue(minute, forKey: "minute")
         listOfEntity.setValue(reminderName, forKey: "reminderName")
         listOfEntity.setValue(monday, forKey: "monday")
         listOfEntity.setValue(tuesday, forKey: "tuesday")
         listOfEntity.setValue(wednesday, forKey: "wednesday")
         listOfEntity.setValue(thursday, forKey: "thursday")
         listOfEntity.setValue(friday, forKey: "friday")
         listOfEntity.setValue(saturday, forKey: "saturday")
         listOfEntity.setValue(sunday, forKey: "sunday")
         listOfEntity.setValue(isReminderActive, forKey: "isActive")
              
          do {
              
             try context.save()
              message = "00"
          } catch let error as NSError {
             
              print("Gagal save context \(error), \(error.userInfo)")
              message = "01"
          }
        
        return message
    }
    
    func retrieveNotificationFromCoreData()->[ReminderModel]
    {
        
         var tempReminderData =  [ReminderModel]()
        
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return tempReminderData }
                 let context = appDel.persistentContainer.viewContext
            
                 let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Reminder")
             
             do {
                    let result = try context.fetch(fetch)
                    for data in result as! [NSManagedObject]
                     {
                       print("reminderName : \(data.value(forKey: "reminderName")as! String)")
                        print("hour : \(data.value(forKey: "hour")as! String)")
                        print("minute : \(data.value(forKey: "minute")as! String)")
                        print("monday : \(data.value(forKey: "monday")as! Bool)")
                        print("tuesday : \(data.value(forKey: "tuesday")as! Bool)")
                        print("wednesday : \(data.value(forKey: "wednesday")as! Bool)")
                        print("thursday : \(data.value(forKey: "thursday")as! Bool)")
                        print("friday : \(data.value(forKey: "friday")as! Bool)")
                        print("saturday : \(data.value(forKey: "saturday")as! Bool)")
                        print("sunday : \(data.value(forKey: "sunday")as! Bool)")
                        print("isActive : \(data.value(forKey: "isActive")as! Bool)\n")
                        
                    tempReminderData.append(ReminderModel(Hour: "\(data.value(forKey: "hour")!):\(data.value(forKey: "minute")!)", remindName: "\(data.value(forKey: "reminderName")as! String)", isMon: data.value(forKey: "monday")as! Bool, isTue: data.value(forKey: "tuesday")as! Bool, isWed: data.value(forKey: "wednesday")as! Bool, isThu: data.value(forKey: "thursday")as! Bool, isFri: data.value(forKey: "friday")as! Bool, isSat: data.value(forKey: "saturday")as! Bool, isSun: data.value(forKey: "sunday")as! Bool, isReminderActive: data.value(forKey: "isActive")as! Bool))
                        
                    }
              }
             catch
             {
                 print("Failed")
             }
        
        return tempReminderData
    }
    
    func deleteDataInReminder(uniqueReminderName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Reminder")
        fetchRequest.predicate = NSPredicate(format: "reminderName = %@", uniqueReminderName)
        
        do{
            let dataToDelete = try managedContext.fetch(fetchRequest)[0] as! NSManagedObject
            managedContext.delete(dataToDelete)
            
            try managedContext.save()
        }catch let err{
            print(err)
        }
    }

}

//supaya saat appnya jalan notifnya masih bisa muncul
extension NotificationHelper: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert])
    }

}

