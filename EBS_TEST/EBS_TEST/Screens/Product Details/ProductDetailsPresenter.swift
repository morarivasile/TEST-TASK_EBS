//
//  ProductDetailsPresenter.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import Foundation

final class ProductDetailsPresenter {
    var interactor: ProductDetailsInteractorProtocol!
    weak var view: ProductDetailsViewProtocol?
    
    private func setupModels(for productResponse: ProductResponse) {
        let infoPoints = ["Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."]
        
        let imageModel = AnyCell(ImageCellModel(productResponse.image))
        let shortInfoModel = AnyCell(ShortInfoCellModel(productResponse))
        let infoModel = AnyCell(InformationCellModel(productResponse.details))
        let infoPointsModel = AnyCell(InfoPointsCellModel(infoPoints))
        
        DispatchQueue.main.async {
            self.view?.models = [imageModel, shortInfoModel, infoModel, infoPointsModel]
        }
    }
}

// MARK: - ProductDetailsPresenterProtocol

extension ProductDetailsPresenter: ProductDetailsPresenterProtocol {
    func loadProduct() {
        interactor.loadProduct { result in
            switch result {
            case let .success(productResponse):
                self.setupModels(for: productResponse)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: - ProductDetailsInteractorOutputProtocol

extension ProductDetailsPresenter: ProductDetailsInteractorOutputProtocol {
    func didStartFetchingProduct() {
        DispatchQueue.main.async {
            self.view?.showLoadingView()
        }
    }
    
    func didFinishFetchingProduct() {
        DispatchQueue.main.async {
            self.view?.hideLoadingView()
        }
    }
}
