//
//  ItemsScreenViewModel.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

class ItemsScreenViewModel {
    
    //MARK: - Attributes
    let itemViewModels: Observable<[ItemViewModel]> = Observable([])
    let tagName: String
    
    //MARK: - init
    init(_ tagName: String) {
        self.tagName = tagName
    }
}
