//
//  Interactor.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class MainScreenInteractor: MainScreenInteractorProtocol {
    
    //MARK: - Attributes
    let presenter: MainScreenPresenterProtocol
    let remoteWorker: ElmenusWorkerProtocol
    let localWorker: ElmenusDataBaseWorker
    
    //MARK: - init
    init(_ presenter: MainScreenPresenterProtocol,_ remoteWorker: ElmenusWorkerProtocol,_ localWorker: ElmenusDataBaseWorker = ElmenusDataBaseWorker.shared) {
        self.presenter = presenter
        self.remoteWorker = remoteWorker
        self.localWorker = localWorker
    }
    
    //MARK: - Methods
    func getTags(_ page: Int) {
        if NetworkState.isConnected {
            remoteWorker.getTags(page, { [weak self] response in
                self?.localWorker.saveEntities(response.tags.map{$0.entity})
                self?.presenter.handleTagsResponse(response.tags)
            }) { [weak self] error in
                self?.presenter.handleTagsError(error)
            }
        } else {
            let tags = localWorker.loadTags()
            presenter.handleTagsResponse(tags)
        }
    }
    
}
