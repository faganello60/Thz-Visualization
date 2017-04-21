//
//  CreateResultViewController.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 20/02/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class CreateResultViewController: UITableViewController, APIManager{

    @IBOutlet weak var dateSample: UIDatePicker!
    @IBOutlet weak var txt_Name: SkyFloatingLabelTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveResult(_ sender: Any) {
        let request = sendRequest("http://192.168.1.8:8080/test")
        
        processRequest(dataRequest: request) { [unowned self] (result) in
            CoreDataFake.shared.addVisualization(vd: result)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func initialConfiguration(){
        dateSample.maximumDate = Date()
    }
    
}
