//
//  ItemsScreenPresenter.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class ItemsScreenPresenter: ItemsScreenPresenterProtocol {
    
    //MARK: - Attributes
    private weak var view: ItemsScreenViewControllerProtocol?
    
    //MARK: - init
    init(view: ItemsScreenViewControllerProtocol) {
        self.view = view
    }
    
    //MARK: - Methods
    func handleTagsResponse(_ items: [Item]) {
        let itemViewModels = items.compactMap{ItemViewModel($0.name, $0.photoUrl, $0.description)}
        view?.updateUIWithItems(itemViewModels)
    }
    
    func handleTagsError(_ error: Error) {
        view?.updateUIWihError(error)
    }
}
