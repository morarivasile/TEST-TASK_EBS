//
//  ImageTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var cellIMageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellIMageView.image = nil
    }
    
    func setImage(imageStringURL: String) {
        cellIMageView.setImage(stringURL: imageStringURL)
    }
}
