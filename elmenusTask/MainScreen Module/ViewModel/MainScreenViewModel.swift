//
//  MainScreenViewModel.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import SimpleTwoWayBinding

class MainScreenViewModel {
    
    //MARK: - Attributes
    let tagViewModels: Observable<[TagViewModel]> = Observable([])
    let navigationTitle: String = "Tags"
    var pageNumber = 0
}
