//
//  ItemEntity.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import RealmSwift

class ItemEntity: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var photoUrl: String = ""
    @objc dynamic var itemDescription: String = ""
   
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension ItemEntity {
    var object: Item {
        let item = Item(id: id, name: name, photoUrl: photoUrl, description: itemDescription)
        return item
    }
}
