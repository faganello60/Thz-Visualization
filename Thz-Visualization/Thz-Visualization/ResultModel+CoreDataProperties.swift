//
//  ResultModel+CoreDataProperties.swift
//  
//
//  Created by Bruno Faganello Neto on 20/04/17.
//
//

import Foundation
import CoreData


extension ResultModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ResultModel> {
        return NSFetchRequest<ResultModel>(entityName: "ResultModel")
    }

    @NSManaged public var csr: NSObject?
    @NSManaged public var date: NSDate?
    @NSManaged public var isr: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var total: NSObject?

}
