//
//  URLRequest-Extension.swift
//  XPack2
//
//  Created by octavianus on 14/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation

extension URLRequest{
    init<A>(resource: Resource<A>){
        self.init(url: resource.url )
        self.httpMethod = resource.method.getMethodString()
        
        if case let .post(bodyData) = resource.method{
            self.httpBody = bodyData
        }
    }
}
