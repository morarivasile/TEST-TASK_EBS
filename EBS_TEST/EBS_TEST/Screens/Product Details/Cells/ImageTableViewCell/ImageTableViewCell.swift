//
//  ImageTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

protocol ImageTableViewCellDelegate: class {
    func didTapFavoriteButton(_ cell: ImageTableViewCell, isFavorite: Bool)
}

final class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var cellIMageView: UIImageView!
    
    @IBOutlet weak private var favoriteButton: UIButton!
    
    weak var delegate: ImageTableViewCellDelegate?
    
    private var isFavorite: Bool = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellIMageView.image = nil
    }
    
    func setImage(imageStringURL: String) {
        cellIMageView.setImage(stringURL: imageStringURL)
    }
    
    func setFavorite(_ isFavorite: Bool) {
        self.isFavorite = isFavorite
        favoriteButton.setImage(UIImage(named: isFavorite ? "favorite_filled" : "favorite_empty"), for: .normal)
        
    }
    
    @IBAction private func didTapOnFavoriteButton(_ sender: UIButton) {
        isFavorite.toggle()
        setFavorite(isFavorite)
        
        delegate?.didTapFavoriteButton(self, isFavorite: isFavorite)
    }
}
