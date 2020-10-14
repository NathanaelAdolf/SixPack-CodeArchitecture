//
//  XPackModal.swift
//  XPack2
//
//  Created by octavianus on 14/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import UIKit

enum ModalType{
    case success(message: String)
    case failure(message: String)
}

extension UIView{
    
    func showModal(type: ModalType){
        let modal = UIView()
        //Customize the modal or Load from XIB / Storyboard
        self.addSubview(modal)
    }
}
