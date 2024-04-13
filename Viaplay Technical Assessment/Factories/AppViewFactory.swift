//
//  AppViewFactory.swift
//  Viaplay Technical Assessment
//
//  Created by Carlos Gonzalez2 on 13/4/24.
//

import UIKit

final class AppViewFactory: AppViewFactoryProtocol {
    var coreDataManager: CoreDataManagerProtocol?
    
    private let SECTION_LIST = "SectionListView"
    private let SECTION_DETAIL = "SectionDetail"
    
    init(coreDataManager: CoreDataManagerProtocol?) {
        self.coreDataManager = coreDataManager
    }
    
    private func createViewController<T>(controller: T.Type, storyboardId: String) -> T where T: UIViewController {
        let storyboard = UIStoryboard(name: storyboardId, bundle: Bundle(for: T.self))
        let viewController = storyboard.instantiateViewController(withIdentifier: storyboardId.lowercased()) as! T
        return viewController
    }
    
    func createMainViewController(router: AppRouterProtocol?) -> UIViewController {
        return UINavigationController(rootViewController: createSectionListViewController(router: router))
    }
    
    func createSectionListViewController(router: AppRouterProtocol?) -> SectionListViewController {
        let vc = createViewController(controller: SectionListViewController.self, storyboardId: SECTION_LIST)
        vc.interactor = SectionListInteractor(
            presenter: SectionListPresenter(view: vc),
            databaseService: coreDataManager
        )
        vc.router = router
        return vc
    }
    
    func createSectionDetailViewController(with section: ViaplaySectionDomain?) -> SectionDetailViewController {
        let vc = createViewController(controller: SectionDetailViewController.self, storyboardId: SECTION_DETAIL)
        vc.interactor = SectionDetailInteractor(
            presenter: SectionDetailPresenter(view: vc),
            databaseService: coreDataManager,
            section: section
        )
        return vc
    }
}
