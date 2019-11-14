//
//  ViewController.swift
//  KittenProject
//
//  Created by André Felipe Fleck Bedran on 13/11/19.
//  Copyright © 2019 André Bedran. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private(set) var disposeBag: DisposeBag = DisposeBag()
    private weak var viewModel: GalleryViewModelImplementation!
    
    override func viewDidLoad() {
        self.collectionView.backgroundColor = .white
        super.viewDidLoad()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            self.viewModel = appDelegate.viewModel
        }
        configureCollectionView()
        bindViewModel()
        viewModel.getCats()
    }
    
    private func configureCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "ImageCell",
                                           bundle: Bundle.main),
                                     forCellWithReuseIdentifier: "ImageCell")
    }
    
    private func bindViewModel() {
        self.viewModel.imagesSubject
            .bind(to: collectionView.rx.items(cellIdentifier: "ImageCell", cellType: ImageCell.self)) { index, model, cell in
                let indicator = ImageIndicator()
                cell.imagePreview.kf.indicatorType = .custom(indicator: indicator)
                cell.backgroundColor = .black
                if let source = URL(string: model.link) {
                    cell.imagePreview.kf.setImage(with: source)
                }
                cell.layer.cornerRadius = 10.0
                
        }.disposed(by: disposeBag)
        
        self.viewModel.errorSubject.asObservable().subscribe {[weak self] (errorEvent) in
            if errorEvent.element != nil {
                let alert = UIAlertController(title: "Erro",
                                              message: "Não foi possível carregar imagens.",
                                              preferredStyle: .alert)
                self?.show(alert, sender: self)
            }
        }.disposed(by: disposeBag)
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let inset: CGFloat = 10
        let minimumInteritemSpacing: CGFloat = 10
        let cellsPerRow = 2
        
        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        return CGSize(width: itemWidth, height: itemWidth)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10.0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
