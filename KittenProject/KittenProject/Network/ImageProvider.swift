//
//  ImageProvider.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Moya

enum ImageProvider {
    case search(query: String)
}

extension ImageProvider: TargetType {
    var baseURL: URL {
        return ProjectUtil.baseURL
    }
    
    var path: String {
        // As we only have one case, this is trivial
        return "search"
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        do {
            return try Data(contentsOf: URL(string:Bundle.main
                .path(forResource: "data",
                      ofType: "json")!)!,
                      options: .mappedIfSafe)
        } catch {
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .search(let query):
            return .requestParameters(parameters: ["q" : query], encoding: URLEncoding.queryString)
        }
        
    }
    
    var headers: [String : String]? {
        // Again, not my preferred way of doing this. Should also be in a separate environment or bundled and encrypted.
        return ["Authorization": "Client-ID 1ceddedc03a5d71"]
    }
    
    
}
