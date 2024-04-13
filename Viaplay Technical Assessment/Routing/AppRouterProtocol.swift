//
//  AppRouterProtocol.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation
import UIKit

protocol AppRouterProtocol: AnyObject {
    var factory: AppViewFactoryProtocol? { get set }
    func showSectionDetail(navigationController: UINavigationController?, with uri: URL?)
}
