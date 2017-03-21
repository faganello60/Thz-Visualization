//
//  APIManager.swift
//  Thz-Visualization
//
//  Created by Bruno Faganello on 02/03/17.
//  Copyright © 2017 Faga. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

protocol APIManager{}

extension APIManager{
    func sendRequest(_ urlString:String) -> DataRequest{
        let url = URL(string: urlString)!
        let request = Alamofire.request(url)
        return request
    }
    
    func processRequest(dataRequest:DataRequest, completionHandler:@escaping (_ result:VisualizationData)->Void){
        dataRequest.responseObject { (response:DataResponse<VisualizationData>) in
            if let result = response.result.value {
                DispatchQueue.main.async {
                    completionHandler(result)
                }
            }
        }
    }
}

