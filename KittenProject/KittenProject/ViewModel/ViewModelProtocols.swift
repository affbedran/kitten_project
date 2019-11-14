//
//  ViewModelProtocols.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation
import RxSwift

protocol GalleryViewModelImplementation {
    var imagesSubject: PublishSubject<[Image]> {get}
    var errorSubject: PublishSubject<Error> {get}
    func getCats()
}
