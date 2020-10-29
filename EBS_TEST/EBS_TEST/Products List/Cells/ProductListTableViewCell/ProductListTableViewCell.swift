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
    
    @IBOutlet weak private var titleLabel: UILabel!
    
    @IBOutlet weak private var subtitleLabel: UILabel!
    
    @IBOutlet weak private var priceLabel: UILabel!
    
    func configure(for viewModel: ProductViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        priceLabel.attributedText = getAttributedPrice(from: viewModel.displayPrice)
        productImageView.setImage(stringURL: viewModel.imageStringURL)
    }
    
    private func getAttributedPrice(from model: ProductViewModel.DisplayPrice) -> NSAttributedString {
        if let oldPrice = model.oldPrice {
            let priceString = NSMutableAttributedString(string: "\(model.price) - ", attributes: [
                .font: UIFont.systemFont(ofSize: 24, weight: .regular),
                .foregroundColor: UIColor.priceBlue
            ])
            
            let oldPriceString = NSAttributedString(string: oldPrice, attributes: [
                .font: UIFont.systemFont(ofSize: 20, weight: .regular),
                .foregroundColor: UIColor.oldPriceGray,
                NSAttributedString.Key.strikethroughStyle: 1
            ])
            
            priceString.append(oldPriceString)
            
            return priceString
        } else {
            return NSAttributedString(string: model.price, attributes: [
                .font: UIFont.systemFont(ofSize: 24, weight: .regular),
                .foregroundColor: UIColor.priceBlue
            ])
        }
    }
}
