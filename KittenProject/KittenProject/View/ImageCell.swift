//
//  ImageCell.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {

    @IBOutlet weak var imagePreview: UIImageView!
    
    override func prepareForReuse() {
        self.imagePreview.kf.cancelDownloadTask()
    }

}
