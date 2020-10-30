//
//  ProductListTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit
import Foundation

final class ProductListTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var productImageView: UIImageView!
    
    @IBOutlet weak private var shortInfoView: ProductShortInfoView!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
    
    func configure(for viewModel: ProductViewModel) {
        shortInfoView.setTitle(viewModel.title)
        shortInfoView.setSubtitle(viewModel.description)
        shortInfoView.setPriceLabel(price: viewModel.displayPrice.price, oldPrice: viewModel.displayPrice.oldPrice)
        
        productImageView.setImage(stringURL: viewModel.imageStringURL)
    }
    
    
}
