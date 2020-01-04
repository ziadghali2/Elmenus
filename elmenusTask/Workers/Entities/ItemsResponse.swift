//
//  ItemsResponse.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

struct ItemsResposne {
    var items: [Item]
}

//MARK: - Codable
extension ItemsResposne: Codable {}
