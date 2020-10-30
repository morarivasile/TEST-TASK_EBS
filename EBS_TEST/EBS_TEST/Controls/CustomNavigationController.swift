//
//  CustomNavigationController.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        
        let image = UIImage(named: "back_icon")?
            .resized(targetSize: .init(width: 25, height: 25))?
            .withRenderingMode(.alwaysOriginal)
        
        navigationBar.backIndicatorImage = image
        navigationBar.backIndicatorTransitionMaskImage = image
        navigationBar.barTintColor = .mainBlueColor
    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        item.imageInsets = .init(top: 20, left: 0, bottom: 5, right: 20)
        viewController.setNavigationTitleImageView(with: "header")
        viewController.navigationItem.backBarButtonItem = item
    }
    
}
