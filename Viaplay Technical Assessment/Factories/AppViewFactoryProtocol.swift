//
//  AppViewFactoryProtocol.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

protocol AppViewFactoryProtocol {
    func createMainViewController(router: AppRouterProtocol?) -> UIViewController
    func createSectionListViewController(router: AppRouterProtocol?) -> SectionListViewController
    func createSectionDetailViewController() -> UIViewController
}
