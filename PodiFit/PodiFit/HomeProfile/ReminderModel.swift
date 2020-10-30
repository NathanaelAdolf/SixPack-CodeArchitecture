//
//  ReminderModel.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

class ReminderModel {
    
    var Hour: String!
    var reminderName: String!
    
    var isMon: Bool = false
    var isTue: Bool = false
    var isWed: Bool = false
    var isThu: Bool = false
    var isFri: Bool = false
    var isSat: Bool = false
    var isSun: Bool = false
    
    var isReminderActive: Bool = false
    
    init(Hour: String, remindName: String,isMon: Bool,isTue: Bool,isWed: Bool,isThu: Bool,isFri: Bool,isSat: Bool,
         isSun: Bool,isReminderActive: Bool) {
        
        self.Hour = Hour
        self.reminderName = remindName
        
        self.isMon = isMon
        self.isTue = isTue
        self.isWed = isWed
        self.isThu = isThu
        self.isFri = isFri
        self.isSat = isSat
        self.isSun = isSun
        
        self.isReminderActive = isReminderActive
    }
    
}
