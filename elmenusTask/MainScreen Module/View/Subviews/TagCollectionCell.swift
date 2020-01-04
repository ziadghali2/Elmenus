//
//  MainScreenCell.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import UIKit
import Kingfisher

class TagCollectionCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var tagName: UILabel!
    @IBOutlet weak var tagImageView: UIImageView!
    
    //MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        tagName.text = nil
        tagImageView.image = nil
    }
    
    func fillWith(_ name: String, _ imageUrl: URL) {
        tagName.text = name
        tagImageView.kf.indicatorType = .activity
        tagImageView.kf.setImage(with: imageUrl)
    }

}
