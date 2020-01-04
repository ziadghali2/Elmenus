//
//  ApiService.swift
//  elmenusTask
//
//  Created by Ziad Ghali on 1/3/20.
//  Copyright © 2020 elmenus. All rights reserved.
//

import Moya

class ApiService<T> where T: TargetType {
    // MARK: - Attributes
    let provider = MoyaProvider<T>(plugins: [NetworkLoggerPlugin()])
    
    //MARK: - init
    init() { }
    
    //MARK: - Methods
    func request<R: Codable>(target: T, _ onSuccess: @escaping (R) -> Void, _ onFailure:  @escaping (Error) -> Void) {
        provider.request(target) {
            switch $0 {
            case let .success(response):
                do {
                    let filteredResponse = try response.filterSuccessfulStatusCodes()
                    let result = try JSONDecoder().decode(R.self, from: filteredResponse.data)
                    onSuccess(result)
                } catch {
                    onFailure(error)
                }
            case let .failure(error):
                onFailure(error)
            }
            print("request \($0.debugDescription)")
        }
    }

}
