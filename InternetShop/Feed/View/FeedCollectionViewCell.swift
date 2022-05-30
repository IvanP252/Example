//
//  FeedCollectionViewCell.swift
//  InternetShop
//
//  Created by Mac on 28.05.2022.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: FeedCollectionViewCell.self)
    static let nib = UINib(nibName: String(describing: FeedCollectionViewCell.self), bundle: nil)
    
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.white
        clipsToBounds = true
        layer.cornerRadius = 4
        label.font = UIFont.systemFont(ofSize: 18)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateContentStyle()
    }
    
    func updateContentStyle() {
        let isHorizontalStyle = bounds.width > 2 * bounds.height
        let axis = stackView.axis
        let newAxis: NSLayoutConstraint.Axis = isHorizontalStyle ? .horizontal : .vertical
        
        guard axis != newAxis else { return }
        
        stackView.axis = newAxis
        stackView.spacing = isHorizontalStyle ? 16 : 4
        label.textAlignment = isHorizontalStyle ? .left : .center
        let fontTransform: CGAffineTransform = isHorizontalStyle ? .identity : CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.5) {
            self.label.transform = fontTransform
            self.layoutIfNeeded()
        }
    }
    
    func update(title: String, image: UIImage) {
        imageView.image = image
        label.text = title
    }
}
