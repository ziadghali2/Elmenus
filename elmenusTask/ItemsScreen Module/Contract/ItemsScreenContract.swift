//
//  ItemsScreenContract.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

enum ItemsScreenRoute {
    case details(ItemViewModel)
}

protocol ItemsScreenRouterProtocol {
    func go(to route: ItemsScreenRoute)
}

protocol ItemsScreenInteractorProtocol {
    func getItems(_ name: String)
}

protocol ItemsScreenPresenterProtocol: class {
    func handleTagsResponse(_ tags: [Item])
    func handleTagsError(_ error: Error)
}

protocol ItemsScreenViewControllerProtocol: class {
    func updateUIWithItems(_ itemsViewModels: [ItemViewModel])
    func updateUIWihError(_ error: Error)
}

