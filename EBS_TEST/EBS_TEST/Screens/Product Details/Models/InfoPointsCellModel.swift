//
//  InfoPointsCellModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit.UITableView

struct InfoPointsCellModel: CellModel {
    let infoPoints: [String]
    
    init(_ infoPoints: [String]) {
        self.infoPoints = infoPoints
    }
    
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> ProductInfoPointsTableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.id) as? Cell else { fatalError() }
        
        cell.setupWithInfoPoints(infoPoints)
        
        return cell
    }
}
