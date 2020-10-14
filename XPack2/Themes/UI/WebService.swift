//
//  WebService.swift
//  XPack2
//
//  Created by octavianus on 14/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation

final class Webservice{
    func load<A>(_ resource: Resource<A> ,completion: @escaping (Result<A,NetworkError>)->()  ){
        let request = URLRequest(resource: resource)
        URLSession.shared.dataTask(with: request) { (data, res, err) in
            let data = data.flatMap(resource.parse)
            let httpResponse = res as! HTTPURLResponse
            switch httpResponse.statusCode{
            case 200...220:
                completion(.success(data!))
            case 401...422:
                completion(.failure(.urlNotFound))
            default:
                completion(.failure(.unknownError))
            }
        }.resume()
    }
}

final class CachedWebService{
    var webService = Webservice()
    var cache = Cache()
    
    init(webService: Webservice) {
        self.webService = webService
    }
    
    func load<A>(resource: Resource<A>,update: @escaping (Result<A,NetworkError>)->() ){
        
        if let cache = cache.load(resource: resource){
            update(.success(cache))
        }
        
        // Our resource already parsed the data to A, so we create dump resource to parse to data
        let dataResource = Resource<Data>(url: resource.url, method: resource.method,parse: { $0 } )
    
        webService.load(dataResource, completion: { result in
            switch result {
            case let .failure(error):
                update(.failure(error))
            case let .success(data):
                self.cache.save(data, for: resource)
                update(.success(resource.parse(data)!))
            }
        })
    }
}
