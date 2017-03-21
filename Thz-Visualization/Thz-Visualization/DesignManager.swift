//
//  DesignModel.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 21/02/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit

protocol DesignManager: class {}

extension DesignManager{
    
    func cellDesign(cell:UITableViewCell, indexPath:IndexPath){
        if indexPath.row % 2 == 0{ cell.backgroundColor = UIColor.white }
        else{ cell.backgroundColor = UIColor.cyan }
    }
    
    func prepareView(window:UIWindow?){
        let splitViewController = window?.rootViewController as! UISplitViewController
        let leftNavController = splitViewController.viewControllers.first as! UINavigationController
        let masterViewController = leftNavController.topViewController as! HistoricViewController
        
        let rightNavController = splitViewController.viewControllers.last as! UINavigationController
        let detailViewController = rightNavController.topViewController as! ResultViewController
        masterViewController.delegate = detailViewController
        detailViewController.messageString = 0
    }
}
