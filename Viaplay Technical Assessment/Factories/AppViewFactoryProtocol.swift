//
//  AppViewFactoryProtocol.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

protocol AppViewFactoryProtocol: AnyObject {
    func createMainViewController(router: AppRouterProtocol?) -> UIViewController
    func createSectionListViewController(router: AppRouterProtocol?) -> SectionListViewController
    func createSectionDetailViewController(with uri: URL?) -> SectionDetailViewController
}
