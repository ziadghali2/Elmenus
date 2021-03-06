//
//  Tag.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

struct Tag {
    var tagName: String
    var photoURL: String
}

// MARK: - Codable
extension Tag: Codable { }

//MARK: - Entity
extension Tag {
    var entity: TagEntity{
        let entity = TagEntity()
        entity.tagName = tagName
        entity.photoURL = photoURL
        return entity
    }
}
