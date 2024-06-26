//
//  Router.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation
import UIKit

final class AppRouter: AppRouterProtocol {
    weak var factory: AppViewFactoryProtocol?
    
    init(factory: AppViewFactoryProtocol?) {
        self.factory = factory
    }
    
    func showSectionDetail(navigationController: UINavigationController?, with section: ViaplaySectionDomain?) {
        if let vc = factory?.createSectionDetailViewController(with: section) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
