//
//  BaseTableViewCell.swift
//  SwiftStack
//
//  Created by Vishal Kale on 15/07/19.
//  Copyright © 2019 Tudip. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell, ReusableCellProtocol {
    typealias ModelType = BaseTableViewCellModel

    func setupModel(model: BaseTableViewCellModel) {
        // Setup a cell with model data
        // Must Override
    }
}
