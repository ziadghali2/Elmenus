//
//  MainScreenConfigurator.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

final class MainScreenConfigurator {
    
    static let sharedInstance = MainScreenConfigurator()
    
    func configure(viewController: MainScreenViewController) {
        
        let router = MainScreenRouter(viewController)
        let viewModel = MainScreenViewModel()
        let persenter = MainScreenPresenter(viewController)
        let worker = ElmenusRemoteService()
        let interactor = MainScreenInteractor(presenter: persenter, worker: worker)
        
        viewController.viewModel = viewModel
        viewController.interactor = interactor
        viewController.router = router
        
    }
    
}
