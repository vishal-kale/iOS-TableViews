//
//  BaseTableViewCellModel.swift
//  SwiftStack
//
//  Created by Vishal Kale on 15/07/19.
//  Copyright © 2019 Tudip. All rights reserved.
//

import UIKit
import Foundation

class BaseTableViewCellModel: NSObject, TableViewCellViewModelProtocol {

    typealias CellType = BaseTableViewCell

    static func heightForCell(_ model: BaseTableViewCellModel) -> CGFloat {
        fatalError("Must Override")
    }
}
