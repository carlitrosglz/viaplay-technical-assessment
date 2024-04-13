//
//  ViaplaySectionDetailDTO.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

struct ViaplaySectionDetailDTO: Decodable {
    let title: String?
    let description: String?
    
    func toDomain() -> ViaplaySectionDetailDomain {
        return ViaplaySectionDetailDomain(title: title, description: description)
    }
}
