//
//  CustomCollectionViewCell.swift
//  VKClientApp
//
//  Created by Sergey Simashov on 10.12.2021.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var likeControl: LikeControlView!
    
    
    override func prepareForReuse() {
            super.prepareForReuse()
            imageView.image = nil
        
        }
        
        
        func configure(image: UIImage?, index: Int) {
            imageView.image = image
            
            if index % 2 == 0 {
                backView.backgroundColor = UIColor.magenta
            }
            else {
                backView.backgroundColor = UIColor.systemGreen
            }
        }
}
