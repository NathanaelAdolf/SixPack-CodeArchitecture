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
        
        self.detectAdaptiveClass()
        self.setup()
        self.fetchOrder()
        
        
    }
    
    private func setup(){
        
        historyTable.dataSource = self
    
        dateFormat.dateFormat = "Y-M-d H:mm"
    }
    
    private func fetchOrder(){
        let moc = CoreDataHelper().objectContext()
        
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        let sort: NSSortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        orderRequest.sortDescriptors?.append(sort)
        
        do{
            try self.historyData = moc.fetch(orderRequest) as [Order]
            
        }catch{
            
        }
        
    }
    
    @IBAction func dismiss(){
        guard let sb = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {return}
        self.show(sb, sender: nil)
    }
    
    deinit {
        print("deinit")
    }
}

extension HistoryTableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = historyData{
            return data.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyTable.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        
        if let order = historyData?[indexPath.row]{
            
            cell.textLabel?.text = dateFormat.string(from: order.timestamp!)
            print(order.bowl?.ingredients)
            cell.detailTextLabel?.text = "Rp. \(order.bowl?.price)"
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
}
