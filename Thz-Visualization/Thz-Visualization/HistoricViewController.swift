//
//  HistoricViewController.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 20/02/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit

class HistoricViewController: UITableViewController,DesignManager,Reload {

    weak var delegate: HistoricSelectedDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.preferredPrimaryColumnWidthFraction = 0.3
        self.tableView.tableFooterView = UIView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func reload(){
        self.tableView.reloadData()
    }
}




// MARK: - Table view data source
extension HistoricViewController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {                return CoreDataFake.shared.resultsV.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let obj = CoreDataFake.shared.returnVisualization(indexOfArray: indexPath.row)
        cell.textLabel?.text = obj.name
        
        cellDesign(cell: cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.historicSelected(newHistoric:indexPath.row)
    }
}


