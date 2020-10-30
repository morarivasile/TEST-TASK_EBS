//
//  InformationTableViewCell.swift
//  EBS_TEST
//
//  Created by Vasile Morari on 30.10.2020.
//

import UIKit

final class InformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var infoLabel: UILabel!
    
    func setInfo(_ info: String) {
        infoLabel.text = info
    }
}
