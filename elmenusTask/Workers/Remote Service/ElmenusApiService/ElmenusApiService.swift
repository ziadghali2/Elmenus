//
//  ElmenusApiService.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation

class ElmenusApiService: ApiService<ElmenusEndPoint> {
    
    func getTags(_ page: Int, _ onSuccess: @escaping (TagsResponse) -> Void, _ onFailure:  @escaping (Error) -> Void) {
        request(target: .tags(page), onSuccess, onFailure)
    }
    
    func getItems(_ tagName: String, _ onSuccess: @escaping (ItemsResposne) -> Void, _ onFailure:  @escaping (Error) -> Void) {
        request(target: .items(tagName), onSuccess, onFailure)
    }
}
