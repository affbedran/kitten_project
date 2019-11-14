//
//  DataResponse.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation

class DataResponse<T>: Codable where T: Codable {
    let data: [T]?
    let success: Bool?
    let status: Int
}
