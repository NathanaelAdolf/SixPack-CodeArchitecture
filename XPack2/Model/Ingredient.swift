//
//  Ingredient.swift
//  XPack2
//
//  Created by Jazilul Athoya on 10/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import Foundation

struct Ingredient: Hashable {
    var name: String
    var price: Int
    var image: String
    
    var hashValue: Int {
        get {
            return name.hashValue;
        }
    }
    
    static func ==(lhs: Ingredient, rhs: Ingredient) -> Bool {
        return lhs.name == rhs.name
    }
}
