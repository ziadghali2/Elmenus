//
//  Item.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

struct Item {
    var id: Int
    var name: String
    var photoUrl: String
    var description: String
}

//MARK: - Codable
extension Item: Codable {}
