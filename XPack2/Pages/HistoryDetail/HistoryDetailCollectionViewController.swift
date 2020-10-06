//
//  HistoryDetailCollectionViewController.swift
//  XPack2
//
//  Created by octavianus on 15/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController{
    
    var bowl: Bowl?
    var ingredientIndex: [IngredientType] = []
    var ingredients: [IngredientType: [(String,Double)]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
}

