//
//  BaseService.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Moya

class BaseService<T: TargetType> {
    
    var provider: MoyaProvider<T>
    
    init(operationMode: NetworkOperationMode = ProjectUtil.currentOperationMode) {
        switch operationMode {
        case .normal:
            provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin(verbose: true)])
        case .stubResponse:
            provider = MoyaProvider<T>(stubClosure: {(_: T) -> Moya.StubBehavior in return .immediate}, plugins: [])
        case .stubWithDelay(delay: let delay):
            provider = MoyaProvider<T>(stubClosure: {(_: T) -> Moya.StubBehavior in return .delayed(seconds: delay)}, plugins: [])
        case .stubWithError(statusCode: let statusCode, data: let data):
            provider = MoyaProvider<T>(endpointClosure: MockResponseManager<T>.createEndpointClosure(statusCode: statusCode, data: data), stubClosure: {(_: T) -> Moya.StubBehavior in return .immediate}, plugins: [])
        }
    }
}
