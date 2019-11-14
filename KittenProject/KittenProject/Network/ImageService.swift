//
//  ImageService.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Moya
import RxSwift

final class ImageService: BaseService<ImageProvider> {
    
    func getCats() -> Single<DataResponse<Gallery>> {
        return provider
            .rx
            .request(.search(query: "cat"))
            .filterSuccessfulStatusCodes()
            .map(DataResponse<Gallery>.self)
    }
}
