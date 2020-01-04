//
//  Interactor.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

protocol MainInteractorProtocol {
    func getTags(_ page: Int, _ onSuccess: @escaping (TagsResponse) -> Void, _ onFailure:  @escaping (Error) -> Void)
}

class MainInteractor {
    func getTags(_ page: Int, _ onSuccess: @escaping (TagsResponse) -> Void, _ onFailure:  @escaping (Error) -> Void) {
        let service = ElmenusApiService()
        service.getTags(page, onSuccess, onFailure)
    }
}
