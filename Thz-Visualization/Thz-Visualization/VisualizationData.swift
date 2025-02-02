//
//  VisualizationData.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 06/03/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit
import ObjectMapper

class VisualizationData: Mappable {
    var csr:CSR?
    var isr:ISR?
    var total:Total?
    var name:String = "Experimento sem nome"
    var date:Date = Date()
   
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public required init?(map: Map) {}
    
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    public func mapping(map: Map) {
        csr <- map["csr"]
        isr <- map["isr"]
        total <- map["total"]
    }
    
}
