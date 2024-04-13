//
//  SectionDetailInteractor.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

final class SectionDetailInteractor: SectionDetailInteractorProtocol {
    var presenter: SectionDetailPresenterProtocol?
    
    init(presenter: SectionDetailPresenterProtocol?) {
        self.presenter = presenter
    }
    
    func getSectionDetail(from url: URL?) async {
        guard let url else { return }
        
        do {
            let section: ViaplaySectionDetailDTO = try await Network.shared.callTo(url: url, method: .GET)
            presenter?.present(item: section.toDomain())
        } catch {
            print(error)
        }
    }
}
