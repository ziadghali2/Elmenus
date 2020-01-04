//
//  ItemsScreenInteractor.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import Alamofire

class ItemsScreenInteractor: ItemsScreenInteractorProtocol {
    //MARK: - Attributes
    let presenter: ItemsScreenPresenterProtocol
    let remoteWorker: ElmenusWorkerProtocol
    let localWorker: ElmenusDataBaseWorker
    
    //MARK: - init
    init(_ presenter: ItemsScreenPresenterProtocol,_ remoteWorker: ElmenusWorkerProtocol,_ localWorker: ElmenusDataBaseWorker = ElmenusDataBaseWorker.shared ) {
        self.presenter = presenter
        self.remoteWorker = remoteWorker
        self.localWorker = localWorker
    }
    
    //MARK: - Methods
    func getItems(_ name: String) {
        if NetworkState.isConnected {
            remoteWorker.getItems(name, {[weak self] in
                self?.localWorker.saveEntities($0.items.map{$0.entity})
                self?.presenter.handleTagsResponse($0.items)
            }) { [weak self] in
                self?.presenter.handleTagsError($0)
            }
        } else {
            let items = localWorker.loadItems()
            presenter.handleTagsResponse(items)
        }
    }
    
}

