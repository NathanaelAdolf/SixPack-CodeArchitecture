//
//  HistoryTableViewController.swift
//  XPack2
//
//  Created by octavianus on 13/08/18.
//  Copyright © 2018 Jazilul Athoya. All rights reserved.
//

import UIKit
import CoreData


class HistoryTableViewController: UIViewController{
    
    @IBOutlet weak var historyTable: UITableView!
    
    private var historyData: [Order]?
    
    private var dateFormat = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.setup()
        self.fetchOrder()
        
        
    }
    
    private func setup(){
        
        historyTable.dataSource = self
        historyTable.delegate = self
    
        dateFormat.dateFormat = "Y-M-d H:mm"
    }
    
    private func fetchOrder(){
        let moc = CoreDataHelper().objectContext()
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        let sort: NSSortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        orderRequest.sortDescriptors = [sort]
        
        do{
            try self.historyData = moc.fetch(orderRequest) as [Order]
            
        }catch{
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.detectAdaptiveClass(title: "History")
    }
    
    @IBAction func dismiss(){
        guard let sb = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {return}
        self.show(sb, sender: nil)
    }
    
    deinit {
        print("deinit")
    }
}

extension HistoryTableViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = historyData{
            return data.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTable.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        
        if let order = historyData?[indexPath.row]{
            
            if let time = order.timestamp, let bowl = order.bowl{
                
                for ing in bowl.ingredients{
                    
                    for menu in ing.value{
                        cell.imageView?.image = UIImage(named: menu.key)
                        break
                    }
                    break
                }
                
                
                cell.textLabel?.text = dateFormat.string(from: time)
                cell.detailTextLabel?.text = "\(bowl.bowlType) - Rp. \(bowl.price).000"
                
                return cell
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let order = historyData?[indexPath.row]{
            
            if let bowl = order.bowl{
            
                let sb = UIStoryboard(name: "HistoryDetail", bundle: nil).instantiateInitialViewController() as! HistoryDetailViewController
                sb.bowl = bowl
                sb.navTitle = "\(bowl.bowlType)"
                show(sb, sender: nil)
            
            }
            
        }
    }
    
    
}
