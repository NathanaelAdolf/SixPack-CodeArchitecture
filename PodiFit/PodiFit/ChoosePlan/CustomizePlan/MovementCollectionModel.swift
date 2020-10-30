//
//  MovementCollectionModel.swift
//  PodiFit
//
//  Created by Griffin on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import Foundation

struct MovementModel {
    let movementName: String
    let movementImage: String
    let movementDetail: String
    
    init(movementName: String, movementImage: String, movementDetail: String) {
        self.movementName = movementName
        self.movementImage = movementImage
        self.movementDetail = movementDetail
    }
}
