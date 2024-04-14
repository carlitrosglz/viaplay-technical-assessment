//
//  Endpoint.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

struct Endpoint: Equatable {
    let path: String
    let method: HttpMethod

    private init(path: String, method: HttpMethod = .GET) {
        self.path = path
        self.method = method
    }
    
    static let sectionList = Endpoint(path: "/ios-se")
}
