//
//  UserService.swift
//  RestartTechnologyTask
//
//  Created by Ahmed Samir on 9/22/20.
//  Copyright © 2020 Ahmed Samir. All rights reserved.
//

import Foundation
import Moya

enum UserService{
    case getHomeContent
}

extension UserService: TargetType {
    var baseURL: URL {
        return URL(string: "http://bellman-bd.restart-technology.com/api")!
    }
    
    var path: String {
        switch self {
        case .getHomeContent:
            return "/home"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getHomeContent:
            return .get
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        return JSONEncoding.default
    }

    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
