//
//  ColorHelper.swift
//  XPack2
//
//  Created by Jazilul Athoya on 11/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import Foundation
import UIKit

// Tell your coders to only use colors from this set of variables
class XPackColours {
    
    static var primary: UIColor {
        let r = CGFloat(248.0/255.0)
        let g = CGFloat(146.0/255.0)
        let b = CGFloat(1.0/255.0)
        let a = CGFloat(1.0)
        return UIColor(displayP3Red: r, green: g, blue: b, alpha: a)
    }
    
    static var secondary: UIColor {
        let r = CGFloat(71.0/255.0)
        let g = CGFloat(95.0/255.0)
        let b = CGFloat(55.0/255.0)
        let a = CGFloat(1.0)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    static var lightGray = UIColor.lightGray.cgColor
    
}
