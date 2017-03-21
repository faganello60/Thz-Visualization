//
//  CoreDataFake.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 08/03/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit

class CoreDataFake{
    
    static let shared = CoreDataFake()
    
    var resultsV = [VisualizationData]()
    var a = "X"
    
    
    private init() {}

    func addVisualization(vd:VisualizationData){
        self.resultsV.append(vd)
    }
    
    func returnVisualization(indexOfArray:Int) -> VisualizationData{
        return self.resultsV[indexOfArray]
    }
    
    
}
