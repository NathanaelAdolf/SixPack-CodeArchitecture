//
//  CompletedPlanDetailModel.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 30/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
//
//  CompletedPlanModel.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation
import UIKit

class CompletedPlanDetailModel {
    
    var titleMovement: String!
    var numberWeeks: Int!
    var numberExercise: Int!
    var imagePlan: String!
    
    init(titleMovement: String, numberWeeks: Int,numberExercise: Int, imagePlan: String) {
        self.titleMovement = titleMovement
        self.numberWeeks = numberWeeks
        self.numberExercise = numberExercise
        self.imagePlan = imagePlan
    }
    
}
