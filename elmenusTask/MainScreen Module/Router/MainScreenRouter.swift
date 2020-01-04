//
//  MainScreenRouter.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import UIKit

class MainScreenRouter: MainScreenRouterProtocol {
    
    // MARK: - Attributes
    weak var viewController: UIViewController?
    
    //MARK: - init
    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
    
    //MARK: - Methods
    func go (to destination: MainScreenRoute) {
        switch destination {
            case let .items(tagName,view):
                let itemsVC = ItemsScreenRouter.assembleModule(tagName)
                viewController?.removeAllChilds()
                viewController?.add(child: itemsVC, at: view)
                viewController?.view.layoutIfNeeded()
        }
    }
    
}
