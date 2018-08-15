//
//  HistoryDetailCollectionViewController.swift
//  XPack2
//
//  Created by octavianus on 15/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit

class HistoryDetailViewController: UIViewController{
    
    @IBOutlet weak var ingredientsCollection: UICollectionView!
    var bowl: Bowl?
    
    var ingredientIndex: [IngredientType] = []

    var navTitle: String?
    
    var ingredients: [IngredientType: [(String,Double)]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsCollection.delegate = self
        ingredientsCollection.dataSource = self
        
        if let bowl = self.bowl{
            
            for ing in bowl.ingredients{
                ingredientIndex.append(ing.key)
                var temp: [(String,Double)] = []
                
                for food in ing.value{
                    temp.append((food.key,food.value))
                }
                
                ingredients[ing.key] = temp
                
                
            }
            
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.detectAdaptiveClass(title: navTitle!)
        
        
    }
    
}

extension HistoryDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let count = bowl?.ingredients.count{
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseableView = ingredientsCollection.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as! HistoryDetailCollectionHeader
        
        reuseableView.titleLabel.text = "\(ingredientIndex[indexPath.section])"
        
        return reuseableView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 100.0
        
        
        return CGSize(width: width , height: width * 1.1)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = bowl?.ingredients[ingredientIndex[section]]?.count{
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ingredientsCollection.dequeueReusableCell(withReuseIdentifier: "detailHistoryCell", for: indexPath) as! HistoryDetailCollectionViewCell
        
        let food = ingredients[ingredientIndex[indexPath.section]]![indexPath.row]
        
        cell.ingredientImage.image = UIImage(named: food.0)
        cell.ingredientImage.layer.cornerRadius = 100 / 2
        cell.ingredientImage.layer.masksToBounds = true
        
        cell.ingredientDetail.text = "\(food.0) - \(Int(food.1))X"
        
        
        return cell
        
    }
    

}
