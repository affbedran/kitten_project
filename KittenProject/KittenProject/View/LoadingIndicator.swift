//
//  LoadingIndicator.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

struct ImageIndicator: Indicator {
    let view: UIView = UIActivityIndicatorView()
    
    func startAnimatingView() {
        guard let view = view as? UIActivityIndicatorView else { return }
        view.isHidden = false
        view.startAnimating()
    }
    func stopAnimatingView() {
        guard let view = view as? UIActivityIndicatorView else { return }
        view.isHidden = true
        view.stopAnimating()
    }
}
