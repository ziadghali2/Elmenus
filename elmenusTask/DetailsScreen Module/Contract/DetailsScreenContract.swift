//
//  DetailsScreenContract.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

enum DetailsScreenRoute {
    case close
}

protocol DetailsScreenRouterProtocol {
    func go(to route: DetailsScreenRoute)
}

protocol DetailsScreenInteractorProtocol { }

protocol DetailsScreenPresenterProtocol: class { }

protocol DetailsScreenViewControllerProtocol: class { }

