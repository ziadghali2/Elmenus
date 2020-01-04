//
//  ItemsScreenRouter.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import UIKit

class ItemsScreenRouter: ItemsScreenRouterProtocol {
   
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    //MARK: - Methids
    static func assembleModule(_ tagName: String) -> UIViewController {
        let view = ItemsScreenViewController()
        let router = ItemsScreenRouter()
        let viewModel = ItemsScreenViewModel(tagName)
        let persenter = ItemsScreenPresenter(view: view)
        let remoteWorker = ElmenusRemoteService()
        let interactor = ItemsScreenInteractor(persenter, remoteWorker)
        
        view.viewModel = viewModel
        view.interactor = interactor
        view.router = router
        
        router.viewController = view
        
        return view
    }
    
    func go(to route: ItemsScreenRoute) {
        switch route {
        case let .details(itemViewModel):
            let detailsVC = DetailsScreenRouter.assembleModule(itemViewModel)
            viewController?.navigationController?.pushViewController(detailsVC, animated: true)
            
        }
    }
    
}
