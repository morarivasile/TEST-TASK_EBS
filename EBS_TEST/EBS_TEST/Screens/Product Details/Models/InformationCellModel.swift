//
//  InformationCellModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit.UITableView

struct InformationCellModel: CellModel {
    let info: String
    
    init(_ info: String) {
        self.info = info
    }
    
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> InformationTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id) as? Cell else { fatalError() }
        
        cell.setInfo(info)
        
        return cell
    }
}
