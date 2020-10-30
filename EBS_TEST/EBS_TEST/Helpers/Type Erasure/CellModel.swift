//
//  CellModel.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit.UITableViewCell

/// Cell `Interface`
protocol CellModel {
    /// PAT Placeholder for unknown Concrete Type `Model`
    associatedtype Cell: UITableViewCell
    /// Recieves a parameter of Concrete Type `Model`
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> Cell
}

/// Wrapper `AnyCell`
struct AnyCell {
    private let _tableViewDequeueReusableCell: (_ tableView: UITableView) -> UITableViewCell
    
    init<Model: CellModel>(_ model: Model)  {
        self._tableViewDequeueReusableCell = model.tableViewDequeueReusableCell
    }
    
    /// Conforming to `AnyCell` protocol
    func tableViewDequeueReusableCell(_ tableView: UITableView) -> UITableViewCell {
        return _tableViewDequeueReusableCell(tableView)
    }
}

struct Section {
    let title: String
    let items: [AnyCell]
}
