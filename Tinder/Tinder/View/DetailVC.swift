//
//  DetailVC.swift
//  Tinder
//
//  Created by Jackson Matheus on 16/03/23.
//

import UIKit


class DetailVC: UICollectionViewController {
    
    let cellId = "cellId "
    let headerId = "headerId     "
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .red
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: headerId)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        header.backgroundColor = .purple
        return header
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectinoView: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize {
        return .init(width: self.view.bounds.width, height: 100)
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .blue
        
        return cell
    }
    
//    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
////        return .init(width: self.view.bounds.width, height: 100)
//    }
    
}
