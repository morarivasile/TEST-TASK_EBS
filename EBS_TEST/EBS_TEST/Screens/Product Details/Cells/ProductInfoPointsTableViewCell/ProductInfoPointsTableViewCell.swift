//
//  ProductInfoPointsTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class ProductInfoPointsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    
    func setupWithInfoPoints(_ infoPoints: [String]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        infoPoints.forEach {
            let infoPointView = InfoPointView()
            infoPointView.setupWith(info: $0)
            
            stackView.addArrangedSubview(infoPointView)
        }
    }
}
