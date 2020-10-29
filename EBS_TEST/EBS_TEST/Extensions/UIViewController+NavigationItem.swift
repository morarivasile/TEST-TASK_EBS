//
//  UIViewController+NavigationItem.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 29.10.2020.
//

import UIKit

extension UIViewController {
    func setNavigationTitleImageView(with imageName: String) {
        let imageView: UIImageView = {
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let containerView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        containerView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
        
        navigationItem.titleView = containerView
    }
    
    func setRightBarButton(with imageName: String) {
        let button: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage (named: imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = .init(top: 0, left: 30, bottom: 16, right: 0)
            return button
        }()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func setLeftBarButton(with imageName: String) {
        let button: UIButton = {
            let button = UIButton(type: .custom)
            button.setImage(UIImage (named: imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 16, right: 5)
            return button
        }()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
}
