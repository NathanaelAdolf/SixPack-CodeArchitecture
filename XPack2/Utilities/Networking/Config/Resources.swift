//
//  Resources.swift
//  XPack2
//
//  Created by octavianus on 14/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import CommonCrypto

enum HTTPMethod{
    case get
    case post(body: Data)
    
    func getMethodString()-> String{
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        }
    }
}

typealias JSONDict = [String: AnyObject]

enum NetworkError: Error{
    case urlNotFound
    case unknownError
}

struct Resource<A>{
    let url: URL
    let method: HTTPMethod
    let parse: ((Data) -> A?)
}

extension Resource{
    init(url: URL, method: HTTPMethod = .get, parseData: @escaping ((Data) -> A?)){
        self.url = url
        self.parse = parseData
        self.method = method
    }
}

extension Resource{
    var cacheKey: String{
        return "cache" + String(self.url.path).sha1()
    }
}

