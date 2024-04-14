//
//  SectionDetailCoreDataProtocol.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

protocol SectionDetailCoreDataProtocol {
    func saveSectionDetail(dto: ViaplaySectionDetailDTO?)
    func fetchSectionDetail(with id: String?) -> ViaplaySectionDetailDTO?
}
