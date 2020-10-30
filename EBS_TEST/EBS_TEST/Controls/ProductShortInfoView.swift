//
//  ProductShortInfoView.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class ProductShortInfoView: UIView {
    
    // MARK: - IBOutlets
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .titleBlue
        label.numberOfLines = 0
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setTitle(_ title: String?) {
        titleLabel.text = title
    }
    
    func setSubtitle(_ subtitle: String?) {
        subtitleLabel.text = subtitle
    }
    
    func setPriceLabel(price: String, oldPrice: String?) {
        priceLabel.attributedText = getAttributedPrice(from: price, oldPrice: oldPrice)
    }
    
    // MARK: - Private
    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(priceLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            priceLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func getAttributedPrice(from price: String, oldPrice: String?) -> NSAttributedString {
        if let oldPrice = oldPrice {
            
            let priceString = getMainAttributedPrice("\(price) - ")
            let oldPriceString = getSecondartAttributedPrice(oldPrice)
            
            priceString.append(oldPriceString)
            
            return priceString
        } else {
            return getMainAttributedPrice(price)
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

