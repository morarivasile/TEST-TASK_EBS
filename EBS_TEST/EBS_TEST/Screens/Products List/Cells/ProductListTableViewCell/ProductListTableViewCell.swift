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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }
    
    func configure(for viewModel: ProductViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.description
        priceLabel.attributedText = getAttributedPrice(from: viewModel.displayPrice)
        productImageView.setImage(stringURL: viewModel.imageStringURL)
    }
    
    private func getAttributedPrice(from model: ProductViewModel.DisplayPrice) -> NSAttributedString {
        if let oldPrice = model.oldPrice {
            
            let priceString = getMainAttributedPrice("\(model.price) - ")
            let oldPriceString = getSecondartAttributedPrice(oldPrice)
            
            priceString.append(oldPriceString)
            
            return priceString
        } else {
            return getMainAttributedPrice(model.price)
        }
    }
    
    private func getMainAttributedPrice(_ price: String) -> NSMutableAttributedString {
        return NSMutableAttributedString(string: price, attributes: [
            .font: UIFont.systemFont(ofSize: 24, weight: .regular),
            .foregroundColor: UIColor.priceBlue
        ])
    }
    
    private func getSecondartAttributedPrice(_ price: String) -> NSAttributedString {
        return NSAttributedString(string: price, attributes: [
            .font: UIFont.systemFont(ofSize: 20, weight: .regular),
            .foregroundColor: UIColor.oldPriceGray,
            NSAttributedString.Key.strikethroughStyle: 1
        ])
    }
}
