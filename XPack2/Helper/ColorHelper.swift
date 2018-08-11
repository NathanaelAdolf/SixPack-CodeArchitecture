//
//  ColorHelper.swift
//  XPack2
//
//  Created by Jazilul Athoya on 11/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import Foundation
import UIKit

class ColorHelper {
    
    func getDarkGreen() -> UIColor {
        let r = CGFloat(71.0/255.0)
        let g = CGFloat(95.0/255.0)
        let b = CGFloat(55.0/255.0)
        let a = CGFloat(1.0)
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    func getMainOrange() -> UIColor {
        let r = CGFloat(248.0/255.0)
        let g = CGFloat(146.0/255.0)
        let b = CGFloat(1.0/255.0)
        let a = CGFloat(1.0)
        return UIColor(displayP3Red: r, green: g, blue: b, alpha: a)
    }
    
}
