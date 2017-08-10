//
//  ResultViewController.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 20/02/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit
import Charts

class ResultViewController: UIViewController,ChartViewDelegate{
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var messageString : Int!{
        didSet (old){
            //self.refreshUI(messageString)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        //self.refreshUI()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        print(entry.x)
        print(entry.y)
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
        var series = [ChartDataEntry]()
        let vd = CoreDataFake.shared.resultsV[index]
        
        for i in 0..<vd.csr!.flux!.count{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.locale = Locale(identifier: "US")
            let finalNumberX = numberFormatter.number(from: "\(vd.total!.frequency![i])")
            let finalNumberY = numberFormatter.number(from: "\(vd.total!.flux![i])")
            
            print("X: \(finalNumberX) - Y: \(finalNumberY)")
            
            guard let x1 = finalNumberX, let y1 = finalNumberY else{
                continue
            }
           
            let ySeries = ChartDataEntry(x: log(Double(x1)), y:log(Double(y1)))
            series.append(ySeries)
        }
        

        
        let data = LineChartData()
        let dataset = LineChartDataSet(values: series, label: "CSR")
        dataset.colors = [NSUIColor.red]
        dataset.highlightEnabled = true
        dataset.drawCirclesEnabled = true
        dataset.circleHoleColor = UIColor.blue
        dataset.setDrawHighlightIndicators(true)
        data.addDataSet(dataset)
        
        self.lineChartView.data = data
        self.lineChartView.gridBackgroundColor = NSUIColor.yellow
        self.lineChartView.xAxis.drawGridLinesEnabled = true
        self.lineChartView.xAxis.labelPosition = XAxis.LabelPosition.bottom
        self.lineChartView.chartDescription?.text = "Resultado"
        self.lineChartView.delegate = self
        
        let marker = BalloonMarker(color: UIColor.red, font: UIFont(name: "Arial", size: 14)!, textColor: UIColor.white, insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0))
        
        marker.chartView = self.lineChartView
        marker.minimumSize = CGSize(width: 80, height: 80)
        self.lineChartView.marker = marker
        

        
        self.lineChartView.animate(xAxisDuration: 1.0, yAxisDuration: 1.0)
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
