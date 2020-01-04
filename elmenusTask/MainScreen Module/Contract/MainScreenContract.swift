//
//  MainScreenContract.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import UIKit

enum MainScreenRoute {
    case items(_ tagName: String,_ view: UIView)
}

protocol MainScreenRouterProtocol {
    func go(to route: MainScreenRoute)
}

protocol MainScreenInteractorProtocol {
    func getTags(_ page: Int)
}

protocol MainScreenPresenterProtocol: class {
    func handleTagsResponse(_ tags: [Tag])
    func handleTagsError(_ error: Error)
}

protocol MainScreenViewControllerProtocol: class {
    func updateUIWithTags(_ tagViewModels: [TagViewModel])
    func updateUIWihError(_ error: Error)
}
