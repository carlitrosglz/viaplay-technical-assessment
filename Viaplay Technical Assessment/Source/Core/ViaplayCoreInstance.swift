//
//  ViaplayCoreInstance.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import Foundation
import UIKit

final class ViaplayCoreInstance {
    private let router: AppRouterProtocol?
    private let factory: AppViewFactoryProtocol?
    
    init() {
        router = AppRouter()
        factory = AppViewFactory()
    }
    
    func start(in window: UIWindow?) {
        let rootViewController = factory?.createMainViewController(router: router)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
