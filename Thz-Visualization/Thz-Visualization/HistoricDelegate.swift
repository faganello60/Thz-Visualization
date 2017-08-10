//
//  HistoricDelegate.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 21/02/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit

protocol HistoricSelectedDelegate: class {
    func historicSelected(newHistoric: Int)
}

protocol Reload:class {
    func reload()
}
