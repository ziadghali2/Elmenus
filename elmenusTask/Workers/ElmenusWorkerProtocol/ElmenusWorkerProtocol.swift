//
//  ElmenusLocalServiceProtocol.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/4/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

protocol ElmenusWorkerProtocol {
    func getTags(_ page: Int, _ onSuccess: @escaping (TagsResponse) -> Void, _ onFailure:  @escaping (Error) -> Void)
    func getItems(_ tagName: String, _ onSuccess: @escaping (ItemsResposne) -> Void, _ onFailure:  @escaping (Error) -> Void)
}
