//
//  Service.swift
//  HelloMySPO
//
//  Created by Lazy on 2019/4/25.
//  Copyright © 2019 Lazy. All rights reserved.
//

import Foundation
import Moya


enum Service {
    case fetch(id: String, token: String)
}

extension Service: TargetType {

    var baseURL: URL {
        switch self {
        case .fetch(let id, _):
            return URL(string: "https://api.spotify.com/v1/artists/\(id)/")!
        }
    }

    var path: String {
        return "top-tracks"
    }

    var method: Moya.Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        var pars = [String: Any]()
        pars["country"] = "ES"
        return .requestParameters(parameters: pars, encoding: URLEncoding.queryString)
    }

    var headers: [String: String]? {
        switch self {
        case .fetch(_, let token):
            return ["Authorization": "Bearer \(token)"]
        }
    }
}

