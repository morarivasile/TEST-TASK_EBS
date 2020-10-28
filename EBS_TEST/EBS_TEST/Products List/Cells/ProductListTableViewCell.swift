//
//  ProductListTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 28.10.2020.
//

import UIKit
import Foundation


final class ProductListTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    func configure(for viewModel: ProductViewModel) {
//        textLabel?.text = viewModel.title
        productImageView.setImage(stringURL: viewModel.imageStringURL)
    }
}

extension UITableView {
    func registerCells(classes: [AnyClass]) {
        for cl in classes {
            let cellName = String(describing: cl.self)
            let cellNib = UINib(nibName: cellName, bundle: nil)
            register(cellNib, forCellReuseIdentifier: cellName)
        }
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}



extension UIImageView {
    func setImage(stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        ImageCache.publicCache.load(url: url as NSURL) { [weak self] image in
            self?.image = image
        }
    }
}
