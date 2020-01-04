//
//  DetailsScreenRouter.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import UIKit

class DetailsScreenRouter: DetailsScreenRouterProtocol {
   
    //MARK: - Attributes
    weak var viewController: UIViewController?
    
    //MARK: - Methods
    static func assembleModule(_ itemViewModel: ItemViewModel) -> UIViewController {
        let view = DetailsScreenViewController()
        let router = DetailsScreenRouter()
        let viewModel = DetailsScreenViewModel(itemViewModel)
        
        view.viewModel = viewModel
        view.router = router
        
        router.viewController = view
        
        return view
    }
    
}
