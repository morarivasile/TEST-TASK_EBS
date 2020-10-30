//
//  ImageCellModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit.UITableView

struct ImageCellModel: CellModel {
    let imageStringURL: String
    
    init(_ imageStringURL: String) {
        self.imageStringURL = imageStringURL
    }
    
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> ImageTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id) as? Cell else { fatalError() }
        
        cell.setImage(imageStringURL: imageStringURL)
        
        return cell
    }
}

