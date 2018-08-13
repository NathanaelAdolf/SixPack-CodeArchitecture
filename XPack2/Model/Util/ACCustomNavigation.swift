//
//  ACCustomNavigation.swift
//  AYO CLEAN
//
//  Created by zein rezky chandra on 30/06/18.
//  Copyright © 2018 Alumagubi. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController
{
    func detectAdaptiveClass (){
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                self.navigationController?.navigationBar.prefersLargeTitles = true
                let attributes = [
                    NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)
                ]
                UINavigationBar.appearance().titleTextAttributes = attributes
            default:
                self.navigationController?.navigationBar.prefersLargeTitles = false
                let attributes = [
                    NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20)
                ]
                UINavigationBar.appearance().titleTextAttributes = attributes
            }
        }
    }
}
