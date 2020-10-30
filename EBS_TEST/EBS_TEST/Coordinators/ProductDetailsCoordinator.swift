//
//  ProductDetailsCoordinator.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class ProductDetailsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    private var inputData: ProductDetailsInteractorInputData
    
    init(navigationController: UINavigationController, data: ProductDetailsInteractorInputData) {
        self.navigationController = navigationController
        self.inputData = data
    }
    
    func start() {
        let viewController = ProductDetailsViewController.nibLoaded
        let presenter = ProductDetailsPresenter()
        let interactor = ProductDetailsInteractor(data: inputData)
        let dataService = EBSAPIClient()
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        interactor.output = presenter
        interactor.dataService = dataService
        interactor.favoriteListManager = UserDefaultsProductsListFavoritesManager()
        
        navigationController.pushViewController(viewController, animated: true)
    }
}
