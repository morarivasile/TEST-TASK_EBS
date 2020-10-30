//
//  ProductShortInfoTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class ProductShortInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var shortInfoView: ProductShortInfoView!
    
    func setInfo(_ title: String, subtitle: String, displayPrice: DisplayPrice) {
        shortInfoView.setTitle(title)
        shortInfoView.setSubtitle(subtitle)
        shortInfoView.setPriceLabel(price: displayPrice.price, oldPrice: displayPrice.oldPrice)
    }
}
