//
//  ViewModel.swift
//  SocketPlay
//
//  Created by Vishal Kale on 29/05/18.
//  Copyright © 2018 Vishal Kale. All rights reserved.
//

import UIKit

protocol TableViewCellViewModelProtocol where Self: NSObject, CellType: ReusableCellProtocol, CellType.ModelType == Self {

    associatedtype CellType

    static func heightForCell(_ model: Self) -> CGFloat
    
}
