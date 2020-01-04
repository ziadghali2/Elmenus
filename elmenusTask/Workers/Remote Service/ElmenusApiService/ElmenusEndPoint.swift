//
//  ElmenusEndPoint.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Moya

enum ElmenusEndPoint {
    case tags(Int)
    case items(String)
}

// MARK: - TargetType
extension ElmenusEndPoint: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://elmenus-task.getsandbox.com") else {
            fatalError("Base Url Couldn't be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case let .tags(page): return "/tags/\(page)"
        case let .items(tag): return "/items/\(tag)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type":"application/json"]
    }
    
}

