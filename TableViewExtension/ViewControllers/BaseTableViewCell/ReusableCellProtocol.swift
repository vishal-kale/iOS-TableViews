//
//  ReusableCell.swift
//  SocketPlay
//
//  Created by Vishal Kale on 29/05/18.
//  Copyright © 2018 Vishal Kale. All rights reserved.
//

import UIKit

protocol ReusableCellProtocol where Self: UITableViewCell, ModelType: TableViewCellViewModelProtocol {
    associatedtype ModelType
    static var reuseIdentifier: String { get }
    func setupModel(model: ModelType)
}

extension ReusableCellProtocol {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}

