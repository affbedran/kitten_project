//
//  NetworkOperationMode.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation

///Useful when testing. Can be used to switch to stub responses automatically based on env.
enum NetworkOperationMode {
    
    case normal
    case stubResponse
    case stubWithDelay(delay: TimeInterval)
    case stubWithError(statusCode: Int?, data: Data?)
}

extension NetworkOperationMode: Equatable {
    static func == (lhs: NetworkOperationMode, rhs: NetworkOperationMode) -> Bool {
        switch (lhs, rhs) {
        case (let .stubWithDelay(delay1), let .stubWithDelay(delay2)):
            return delay1 == delay2
        case (let .stubWithError(code1, data1), let .stubWithError(code2, data2)):
            return code1 == code2 && data1 == data2
        case (.stubResponse, .stubResponse), (.normal, .normal):
            return true
        default:
            return false
        }
    }
}
