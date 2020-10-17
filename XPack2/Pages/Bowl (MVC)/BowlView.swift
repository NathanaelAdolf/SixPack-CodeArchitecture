//
//  BowlView.swift
//  XPack2
//
//  Created by Haryanto Salim on 07/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class BowlView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var bowlContentTableView: UITableView!
    @IBOutlet weak var buildInfoLabel: UILabel!
    @IBOutlet weak var bowlTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupView()
    }
    
    public func refreshView(with customer: Customer, bowl: Bowl){
        let (bowlTypeDescription, bowlTypeInfo) = bowl.getBowlTypeDetailInfo()

        bowlTypeLabel?.text = "Hi \(customer.name),"
        buildInfoLabel?.text = "You have \(bowlTypeDescription) bowl. \(bowlTypeInfo)"
        bowlContentTableView?.reloadData()
        priceLabel?.text = "\(bowl.price)K"
    }
    

    
    private func setupView(){
        bowlContentTableView?.estimatedRowHeight = 60
        bowlContentTableView?.rowHeight = UITableView.automaticDimension
        self.backgroundColor = UIColor.white
    }
    
    
}
