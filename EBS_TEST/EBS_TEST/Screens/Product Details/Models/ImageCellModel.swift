//
//  ImageCellModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit.UITableView

struct ImageCellModel: CellModel {
    let imageStringURL: String
    let isFavorite: Bool
    var delegate: ImageTableViewCellDelegate?
    
    init(_ imageStringURL: String, isFavorite: Bool, delegate: ImageTableViewCellDelegate? = nil) {
        self.imageStringURL = imageStringURL
        self.isFavorite = isFavorite
        self.delegate = delegate
    }
    
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> ImageTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id) as? Cell else { fatalError() }
        
        cell.setImage(imageStringURL: imageStringURL)
        cell.setFavorite(isFavorite)
        cell.delegate = delegate
        
        return cell
    }
}

