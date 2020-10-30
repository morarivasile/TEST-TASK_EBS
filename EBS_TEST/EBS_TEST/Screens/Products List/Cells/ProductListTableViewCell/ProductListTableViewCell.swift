//
//  ProductListTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit

protocol ProductListTableViewCellDelegate: class {
    func didTapFavoriteButton(_ cell: ProductListTableViewCell, isFavorite: Bool)
}

final class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var productImageView: UIImageView!
    
    @IBOutlet weak private var shortInfoView: ProductShortInfoView!
    
    @IBOutlet weak private var favoriteButton: UIButton!
    
    weak var delegate: ProductListTableViewCellDelegate?
    
    private var viewModel: ProductViewModel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
    
    func configure(for viewModel: ProductViewModel) {
        self.viewModel = viewModel
        
        updateFavoriteButton(isFavorite: viewModel.isFavorite)
        
        shortInfoView.setTitle(viewModel.title)
        shortInfoView.setSubtitle(viewModel.description)
        shortInfoView.setPriceLabel(price: viewModel.displayPrice.price, oldPrice: viewModel.displayPrice.oldPrice)
        
        productImageView.setImage(stringURL: viewModel.imageStringURL)
    }
    
    private func updateFavoriteButton(isFavorite: Bool) {
        favoriteButton.setImage(UIImage(named: isFavorite ? "favorite_filled" : "favorite_empty"), for: .normal)
    }
    
    
    @IBAction private func didTapOnFavoriteButton(_ sender: UIButton) {
        viewModel?.isFavorite.toggle()
        
        updateFavoriteButton(isFavorite: viewModel?.isFavorite ?? false)
        
        if let viewModel = viewModel {
            delegate?.didTapFavoriteButton(self, isFavorite: viewModel.isFavorite)
        }
    }
}
