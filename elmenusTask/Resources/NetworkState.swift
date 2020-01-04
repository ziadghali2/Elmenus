//
//  NetworkState.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/5/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Foundation
import Alamofire

class NetworkState {

    class var isConnected: Bool {
        return NetworkReachabilityManager(host: "www.google.com")!.isReachable
    }
}
