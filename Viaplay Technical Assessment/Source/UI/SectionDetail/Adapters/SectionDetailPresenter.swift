//
//  SectionDetailPresenter.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation

final class SectionDetailPresenter: SectionDetailPresenterProtocol {
    var view: SectionDetailViewProtocol?
    
    init(view: SectionDetailViewProtocol?) {
        self.view = view
    }
    
    func present(item: ViaplaySectionDetailDomain) {
        view?.update(with: item)
    }
}
