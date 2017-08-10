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
    
    weak var delegate: Reload?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    /*
     
     //http://localhost:8080/isrcsr?ex=2.5&ntotal=1e35&bmagco=1e3&bmagex=1e3&angle=45.0&scsize=0.5&scheight=1e6&sesize=20.0&seheight=1e9&j1=15.0&j2=80.0&etr=2.5&npco=9.72e-10&npex=9.72e-10&ecsr=5.0&xnisrex=0.999&xncsr=5e-15&tb=70.0e-12&kf=701.0
     
     */
    
    
    @IBAction func saveResult(_ sender: Any) {
        let request = sendRequest("http://localhost:8080/test")
        processRequest(dataRequest: request) { [unowned self] (result) in
            let visualization = result
            visualization.name = self.txt_Name.text!
            CoreDataFake.shared.addVisualization(vd: visualization)
             let app = UIApplication.shared.delegate as! AppDelegate
            let splitViewController = app.window?.rootViewController as! UISplitViewController
            let leftNavController = splitViewController.viewControllers.first as! UINavigationController
            let masterViewController = leftNavController.topViewController as! HistoricViewController
            
            self.delegate = masterViewController
            
            self.delegate?.reload()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func initialConfiguration(){
        dateSample.maximumDate = Date()
    }
    
}
