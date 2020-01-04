//
//  TagEntity.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import RealmSwift

class TagEntity: Object {
    
    @objc dynamic var tagName: String = ""
    @objc dynamic var photoURL: String = ""
    
    override class func primaryKey() -> String? {
        return "tagName"
    }
}

extension TagEntity {
    
    var object: Tag {
        let tag = Tag(tagName: tagName, photoURL: photoURL)
        return tag
    }
}
