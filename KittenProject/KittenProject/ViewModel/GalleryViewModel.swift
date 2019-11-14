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
        
        // Flatten collection and remove nil values
        let unfilteredResults = data.compactMap({ $0.images }).reduce([], +)
        
        // filters possible video assets that would break the app
        let filteredResults = unfilteredResults.filter({ ($0.type?.contains("image/" ) ?? false) })
        
        // Send results to our data stream, listened by the view.
        self.imagesSubject.onNext(filteredResults)
    }
    
    
}
