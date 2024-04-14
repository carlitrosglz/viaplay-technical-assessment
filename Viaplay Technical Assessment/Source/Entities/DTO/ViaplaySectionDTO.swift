//
//  MainSectionDTO.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

struct ViaplaySectionDTO: Decodable {
    let id: String?
    let title: String?
    let href: String?
    let type: String?
    let sectionSort: Int?
    let name: String?
    let templated: Bool?
    
    func toDomain() -> ViaplaySectionDomain {
        return ViaplaySectionDomain(id: id, name: title, uri: href?.transformToURL())
    }
}
