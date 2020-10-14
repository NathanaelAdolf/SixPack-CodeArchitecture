//
//  Sample1.swift
//  XPack2
//
//  Created by octavianus on 14/10/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation

var url = URL(string: "http://localhost:8080")
var urlPost = URL(string: "https://httpdump.io/0w5ld")

struct Episode: Codable{
    let id: String
    let title: String
}

extension Episode{
    static let all = Resource<[Episode]>(url: url!) { (data) -> [Episode]? in
        let decoder = JSONDecoder()
        let episodes = try? decoder.decode([Episode].self, from: data)
        return episodes
    }
}

let webService = Webservice()
let cachedWebService = CachedWebService(webService: webService)

/*
cachedWebService.load(resource: Episode.all) { (result) in
    switch result{
    case .failure(let networkError):
        print(networkError)
    case .success(let episodes):
        episodes.forEach({ (episode) in
            print(episode.title)
        })
    }
}
 */
