//
//  ResultViewController.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 20/02/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    var messageString : Int!{
        didSet (old){
            self.refreshUI(messageString)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        //self.refreshUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if CoreDataFake.shared.resultsV.count <= 0{
            return
        }
        else{
            print("HERE")
            self.setChart(0)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI(_ index:Int){
        self.setChart(index)
    }
}


//MARK: - Set Chart
extension ResultViewController{
    fileprivate func setChart(_ index:Int){
        
//        let vd = CoreDataFake.shared.resultsV[index]
//        for i in 0..<vd.csr!.flux!.count{
//            let x = vd.csr!.frequency![i]
//            let y = vd.csr!.flux![i]
//        }
    }
}

//MARK: - My Delegate
extension ResultViewController: HistoricSelectedDelegate{
    func historicSelected(newHistoric: Int) {
        messageString = newHistoric
    }
}

// MARK: - SplitViewController Delegate
extension ResultViewController: UISplitViewControllerDelegate{
    func splitViewController(_ svc: UISplitViewController, shouldHide vc: UIViewController, in orientation: UIInterfaceOrientation) -> Bool {
        return false
    }
}
