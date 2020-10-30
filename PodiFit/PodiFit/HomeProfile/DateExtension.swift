//
//  DateExtension.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 26/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

extension Date
{
    func getHourMinute() -> (hour: Int, minute: Int)
    {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: self)
        let minute = calendar.component(.minute, from: self)
        
        return (hour,minute)
    }
}
