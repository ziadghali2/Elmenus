//
//  MainScreenPresenter.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class MainScreenPresenter: MainScreenPresenterProtocol {
    
    private weak var view: MainScreenViewControllerProtocol?
    
    init(view: MainScreenViewControllerProtocol) {
        self.view = view
    }
    
    func handleTagsResponse(_ tags: [Tag]) {
        let tagViewModels = tags.flatMap{TagViewModel($0.tagName, $0.photoURL)}
        view?.updateUIWithTags(tagViewModels)
    }
    
    func handleTagsError(_ error: Error) {
        view?.updateUIWihError(error)
    }

}
