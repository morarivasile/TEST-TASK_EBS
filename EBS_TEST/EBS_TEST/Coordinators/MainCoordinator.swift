//
//  MainCoordinator.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = ProductsListViewController.nibLoaded
        let dataService = EBSAPIClient()
        let presenter = ProductsListPresenter()
        let interactor = ProductsListInteractor()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = self
        interactor.output = presenter
        interactor.dataService = dataService
        interactor.favoriteListManager = UserDefaultsProductsListFavoritesManager()
        
        navigationController.pushViewController(viewController, animated: true)
    }
}

// MARK: - ProductsListRouterProtocol

extension MainCoordinator: ProductsListRouterProtocol {
    func pushToProductDetailsScreen(with productResponse: ProductResponse) {
        let child = ProductDetailsCoordinator(
            navigationController: navigationController,
            data: .productId(productResponse.id)
        )
        
        childCoordinators.append(child)
        child.start()
    }
}
