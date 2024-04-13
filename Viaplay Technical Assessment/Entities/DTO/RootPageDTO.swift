//
//  RootPageDTO.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

struct RootPageDTO: Decodable {
    let links: RootPageLinksDTO?
    
    enum CodingKeys: String, CodingKey {
        case links = "_links"
    }
}

struct RootPageLinksDTO: Decodable {
    let viaplaySections: [ViaplaySectionDTO]?
    
    enum CodingKeys: String, CodingKey {
        case viaplaySections = "viaplay:sections"
    }
}
