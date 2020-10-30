//
//  CompletedPlanTableViewCell.swift
//  PodiFit
//
//  Created by Nathanael Adolf Sukiman on 23/10/20.
//  Copyright © 2020 Nathanael Adolf Sukiman. All rights reserved.
//

import UIKit

class CompletedPlanTableViewCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var completedPlanCollectionView: UICollectionView!
        
    var collectionViewData = [CompletedPlanModel]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "completedCollectionCell", for: indexPath) as! CompletedPlanCollectionViewCell
                
        cell.titleLabel.text = collectionViewData[indexPath.row].titleMovement
        cell.levelLabel.text = collectionViewData[indexPath.row].level
        cell.periodLabel.text = String(collectionViewData[indexPath.row].period)
        cell.movesLabel.text = String(collectionViewData[indexPath.row].movement)
        
        return cell
    }
        
    func loadCollectionView(data: [CompletedPlanModel])
    {
        self.collectionViewData = data
        
        completedPlanCollectionView.reloadData()
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
       
        completedPlanCollectionView.delegate = self
        completedPlanCollectionView.dataSource = self
        
        self.backgroundColor = .none
                    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
