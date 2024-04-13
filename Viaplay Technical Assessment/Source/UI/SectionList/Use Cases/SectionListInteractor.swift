//
//  SectionListInteractor.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

final class SectionListInteractor: SectionListInteractorProtocol {
    var presenter: SectionListPresenterProtocol?
    
    init(presenter: SectionListPresenterProtocol?) {
        self.presenter = presenter
    }
    
    func getSections() async {
        do {
            let root: RootPageDTO? = try await Network.shared.callTo(endpoint: .sectionList)
            presenter?.present(items: root?.links?.viaplaySections ?? [])
        } catch let error {
            print(error)
        }
    }
}
