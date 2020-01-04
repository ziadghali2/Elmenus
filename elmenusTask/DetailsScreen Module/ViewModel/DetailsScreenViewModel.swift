//
//  DetailsScreenViewModel.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class DetailsScreenViewModel {
    
    //MARK: - Attributes
    let itemViewModel: ItemViewModel
    
    //MARK: - init
    init(_ itemViewModel: ItemViewModel) {
        self.itemViewModel = itemViewModel
    }
}
