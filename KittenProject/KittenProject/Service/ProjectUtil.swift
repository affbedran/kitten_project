//
//  ProjectUtil.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation

class ProjectUtil: NSObject {
    
    static let currentOperationMode: NetworkOperationMode = getCurrentOperationMode()
    
    // Not my favorite way of doing this, but due to time constraints this will do.
    // I would prefer to bundle it in a plist and load it with an utility class.
    static let baseURL: URL = URL(string: "https://api.imgur.com/3/gallery")!
    
    fileprivate class func getCurrentOperationMode() -> NetworkOperationMode {
        #if TEST
        return .stubResponse
        #else
        return .normal
        #endif
    }
}
