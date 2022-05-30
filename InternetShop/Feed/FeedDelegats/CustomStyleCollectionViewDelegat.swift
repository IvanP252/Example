//
//  CustomStyleCollectionViewDelegat.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import UIKit

class CustomStyleCollectionViewDelegat: DefaultCollectionViewDelegate {
    
    private let itemsRow: CGFloat = 3
    private let minItemSpacing: CGFloat = 8
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize: CGSize
        if indexPath.item % 4 == 0 {
            let itemWidth = collectionView.bounds.width - (sectionInsets.left + sectionInsets.right)
            itemSize = CGSize(width: itemWidth, height: 112)
        } else {
            let paddingSpace = sectionInsets.left + sectionInsets.right + minItemSpacing * (itemsRow - 1)
            let availableWidth = collectionView.bounds.width - paddingSpace
            let widthItem = availableWidth / itemsRow
            itemSize = CGSize(width: widthItem, height: widthItem)
        }
        return itemSize
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
