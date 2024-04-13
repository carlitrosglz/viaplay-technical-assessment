//
//  SectionListInteractor.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation
import UIKit

final class SectionListInteractor: SectionListInteractorProtocol {
    var databaseService: SectionListCoreDataProtocol?
    var presenter: SectionListPresenterProtocol?
    
    init(presenter: SectionListPresenterProtocol?, databaseService: SectionListCoreDataProtocol?) {
        self.presenter = presenter
        self.databaseService = databaseService
    }
    
    func getSections() async {
        do {
            let root: RootPageDTO? = try await Network.shared.callTo(endpoint: .sectionList)
            saveData(dto: root)
            presenter?.present(items: root?.links?.viaplaySections ?? [])
        } catch {
            let data = fetchData()
            presenter?.present(items: data ?? [])
        }
    }
    
    private func saveData(dto: RootPageDTO?) {
        Task {
            databaseService?.saveSections(dto: dto?.links?.viaplaySections)
        }
    }
    
    private func fetchData() -> [ViaplaySectionDTO]? {
        return databaseService?.fetchSections()
    }
}
