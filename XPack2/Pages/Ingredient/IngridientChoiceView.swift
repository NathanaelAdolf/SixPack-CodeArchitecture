//
//  IngridientChoiceView.swift
//  XPack2
//
//  Created by zein rezky chandra on 06/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import UIKit

class IngridientChoiceView: UIView {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalPriceView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    private func setupView() {
      backgroundColor = .white
    }

}
