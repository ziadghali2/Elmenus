//
//  ItemTableCell.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import UIKit
import Kingfisher

class ItemTableCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func prepareForReuse() {
        super.prepareForReuse()
        itemLabel.text = nil
        itemImageView.image = nil
    }

    //MARK: - Mehods
    func fillWith(_ name: String, _ imageUrl: URL) {
        itemLabel.text = name
        itemImageView.kf.indicatorType = .activity
        itemImageView.kf.setImage(with: imageUrl)
    }
    
}
