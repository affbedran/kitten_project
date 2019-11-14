//
//  GalleryViewModel.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation
import RxSwift

class GalleryViewModel: GalleryViewModelImplementation {
    var disposeBag = DisposeBag()
    private(set) var imagesSubject = PublishSubject<[Image]>()
    private(set) var errorSubject = PublishSubject<Error>()
    var imgurService = ImageService() //Ideally this would be injected from an upper instance.
    
    func getCats() {
        imgurService.getCats().asObservable().subscribe(onNext: {[weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.flattenImageResponse(response)
        }, onError: { [weak self] (error) in
            
        }).disposed(by: disposeBag)
    }
    
    private func flattenImageResponse(_ response: DataResponse<Gallery>) {
        guard let data = response.data else { return }
        let unfilteredResults = data.compactMap({ $0.images }).reduce([], +)
        let filteredResults = unfilteredResults.filter({ ($0.type?.contains("image/" ) ?? false) })
        
        self.imagesSubject.onNext(filteredResults)
    }
    
    
}
