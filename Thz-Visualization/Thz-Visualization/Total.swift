//
//  Total.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello Neto on 10/08/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit
import ObjectMapper

class Total: Mappable {
    
    var frequency:[Double]?
    var flux:[Double]?
    
    /// This function can be used to validate JSON prior to mapping. Return nil to cancel mapping at this point
    public required init?(map: Map) {}
    
    /// This function is where all variable mappings should occur. It is executed by Mapper during the mapping (serialization and deserialization) process.
    public func mapping(map: Map) {
        frequency <- map["frequency"]
        flux <- map["flux"]
    }
}
