//
//  CoreDataHelper.swift
//  XPack2
//
//  Created by octavianus on 13/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import CoreData
import UIKit

class CoreDataHelper{
    
    func objectContext() -> NSManagedObjectContext{
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
            //This should never happen
            return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        }
        
        return appDelegate.persistentContainer.viewContext
    }
    
}
