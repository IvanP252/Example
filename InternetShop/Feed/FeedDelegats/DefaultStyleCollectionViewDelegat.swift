//
//  DefaultStyleCollectionViewDelegat.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import UIKit

class DefaultStyleCollectionViewDelegat: DefaultCollectionViewDelegate {
    private let itemsRow: CGFloat = 3
    private let minItemSpacing: CGFloat = 8
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right + minItemSpacing * (itemsRow - 1)
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthItem = availableWidth / itemsRow
        return CGSize(width: widthItem, height: widthItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minItemSpacing
    }
}
