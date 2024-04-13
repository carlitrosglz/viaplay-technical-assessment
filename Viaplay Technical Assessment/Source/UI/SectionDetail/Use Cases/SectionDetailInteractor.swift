//
//  SectionDetailInteractor.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

final class SectionDetailInteractor: SectionDetailInteractorProtocol {
    var databaseService: SectionDetailCoreDataProtocol?
    var presenter: SectionDetailPresenterProtocol?
    var section: ViaplaySectionDomain?
    
    init(presenter: SectionDetailPresenterProtocol?, databaseService: SectionDetailCoreDataProtocol?, section: ViaplaySectionDomain?) {
        self.presenter = presenter
        self.databaseService = databaseService
        self.section = section
    }
    
    func getSectionDetail() async {
        guard let url = section?.uri else { return }
        
        do {
            let section: ViaplaySectionDetailDTO = try await Network.shared.callTo(url: url, method: .GET)
            saveData(dto: section)
            presenter?.present(item: section.toDomain(with: self.section?.name))
        } catch {
            if let data = fetchData() {
                presenter?.present(item: data.toDomain(with: self.section?.name))
            }
        }
    }
    
    private func saveData(dto: ViaplaySectionDetailDTO?) {
        Task {
            databaseService?.saveSectionDetail(dto: dto)
        }
    }
    
    private func fetchData() -> ViaplaySectionDetailDTO? {
        return databaseService?.fetchSectionDetail(with: section?.id)
    }
}
