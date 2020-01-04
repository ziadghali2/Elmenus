//
//  TagsResponse.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

struct TagsResponse {
    var tags: [Tag]
}

//MARK: - Codable
extension TagsResponse: Codable {}
