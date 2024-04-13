//
//  SectionListCoreDataProtocol.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

protocol SectionListCoreDataProtocol {
    func saveSections(dto: [ViaplaySectionDTO]?)
    func fetchSections() -> [ViaplaySectionDTO]?
}
