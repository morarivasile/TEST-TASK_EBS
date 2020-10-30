//
//  ShortInfoCellModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit.UITableView

struct ShortInfoCellModel: CellModel {
    let title: String
    let subtitle: String
    let displayPrice: DisplayPrice
    
    init(_ productResponse: ProductResponse) {
        self.title = productResponse.title
        self.subtitle = productResponse.shortDescription
        self.displayPrice = DisplayPrice(
            price: productResponse.price,
            salePrecent: productResponse.salePrecent
        )
    }
    
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> ProductShortInfoTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id) as? Cell else { fatalError() }
        
        cell.setInfo(title, subtitle: subtitle, displayPrice: displayPrice)
        
        return cell
    }
}
