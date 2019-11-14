//
//  MockResponseManager.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation
import Moya

class MockResponseManager<T> where T: TargetType {
    
    typealias ResponseCompletion = ((T) -> Endpoint)
    
    class func createEndpointClosure(statusCode: Int?, data: Data?) -> ResponseCompletion {
        let endpointClosure = { (target: T) -> Endpoint in
            let url = URL(target: target).absoluteString
            return Endpoint(url: url, sampleResponseClosure: {.networkResponse(statusCode ?? 400, data ?? Data()) }, method: target.method, task: target.task, httpHeaderFields: target.headers)
        }
        
        return endpointClosure
    }
}
