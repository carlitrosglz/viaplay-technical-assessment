//
//  SectionListPresenter.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

final class SectionListPresenter: SectionListPresenterProtocol {
    weak var view: SectionListViewProtocol?
    
    init(view: SectionListViewProtocol?) {
        self.view = view
    }
    
    func present(items: [ViaplaySectionDTO]) {
        view?.update(items: items.map { $0.toDomain() })
    }
}
