//
//  BowlView.swift
//  XPack2
//
//  Created by Haryanto Salim on 07/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlView: UIView {
    
    @IBOutlet weak var bowlTypeLabel: UILabel!
    @IBOutlet weak var bowlInfoLabel: UILabel!
    
    @IBOutlet weak var bowlContentTableView: UITableView!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInitialView()
        
    }
    
    //initializing view
    func setInitialView()
    {
        bowlContentTableView.estimatedRowHeight = 60
    }
    
    public func setView(with customer: Customer, bowl: Bowl)
    {
        let(bowlTypeDescription, bowlTypeInfo) = bowl.getBowlTypeDetailInfo()
        bowlTypeLabel.text = "Hi \(customer.name),"
        bowlInfoLabel.text = "You have \(bowlTypeDescription) bowl. \(bowlTypeInfo)"
        bowlContentTableView.reloadData()
        priceLabel.text = "\(bowl.price)K"
    }
    
    // Paste step 8 here
    
    // Paste step 10 here
    
    
    
}




