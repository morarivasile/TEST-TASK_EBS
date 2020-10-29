//
//  UIImageView+AsyncLoading.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 29.10.2020.
//

import UIKit

extension UIImageView {
    func setImage(stringURL: String) {
        guard let url = URL(string: stringURL) else { return }
        ImageCache.publicCache.load(url: url as NSURL) { [weak self] image in
            self?.image = image
        }
    }
}
