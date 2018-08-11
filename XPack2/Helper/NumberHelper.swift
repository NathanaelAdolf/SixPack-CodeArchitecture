//
//  NumberHelper.swift
//  XPack2
//
//  Created by Jazilul Athoya on 11/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import Foundation

class NumberHelper {
    // Function to remove decimal di belakang kalo 0
    func formatTruncateZeroPointDouble(number: Double) -> String {
        if number.rounded(.down) == number {
            return "\(Int(number))"
        } else {
            return "\(number)"
        }
    }
}
