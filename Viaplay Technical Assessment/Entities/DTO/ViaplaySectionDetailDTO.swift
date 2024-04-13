//
//  ViaplaySectionDetailDTO.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

struct ViaplaySectionDetailDTO: Decodable {
    let id: String?
    let title: String?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "sectionId"
        case title = "title"
        case description = "description"
    }
    
    func toDomain() -> ViaplaySectionDetailDomain {
        return ViaplaySectionDetailDomain(id: id, title: title, description: description)
    }
}
