//
//  MainScreenRouter.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import UIKit

class MainScreenRouter {
    
    // MARK: - Attributes
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = MainScreenViewController()
        let router = MainScreenRouter()
        let viewModel = MainScreenViewModel()
        let persenter = MainScreenPresenter(view: view)
        let worker = ElmenusRemoteService()
        let interactor = MainScreenInteractor(presenter: persenter, worker: worker)
        
        view.viewModel = viewModel
        view.interactor = interactor
        view.router = router
        
        return view
    }
    
    func go (to destination: MainScreenRoute) {
        switch destination {
        case .items: break
        }
    }
    
}
