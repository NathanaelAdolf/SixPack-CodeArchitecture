//
//  Cache.swift
//  XPack2
//
//  Created by octavianus on 14/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation

final class Cache{
    
    var fileStorage = CacheStorage()
    
    func load<A>(resource: Resource<A>) -> A?{
        guard case .get = resource.method else { return nil }
        let data = fileStorage[resource.cacheKey]
        return data.flatMap(resource.parse)
    }
    
    func save<A>(_ data: Data,for resource: Resource<A>){
        guard case .get = resource.method else { return }
        fileStorage[resource.cacheKey] = data
    }
}


struct CacheStorage{
    let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
    
    subscript(cacheKey: String) -> Data?{
        get{
            let url = baseURL.appendingPathComponent(cacheKey)
            return try? Data(contentsOf: url)
        }
        set{
            let url = baseURL.appendingPathComponent(cacheKey)
            try? newValue?.write(to: url)
        }
    }
}
