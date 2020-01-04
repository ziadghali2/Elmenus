//
//  Interactor.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class MainScreenInteractor: MainScreenInteractorProtocol {
  
    let presenter: MainScreenPresenterProtocol
    let worker: ElmenusWorkerProtocol
    
    init(presenter: MainScreenPresenterProtocol, worker: ElmenusWorkerProtocol) {
        self.presenter = presenter
        self.worker = worker
    }
    
    func getTags(_ page: Int) {
        worker.getTags(page, { [unowned self] response in
            self.presenter.handleTagsResponse(response.tags)
        }) { [unowned self] error in
            self.presenter.handleTagsError(error)
        }
    }
    
}
