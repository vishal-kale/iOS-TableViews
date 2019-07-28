//
//  UITableView+Ext.swift
//  TableViewExtension
//
//  Created by Vishal Kale on 23/07/19.
//  Copyright © 2019 VishalKale. All rights reserved.
//

import UIKit

extension UITableView {

    // MARK:- Register cell classes
    func registerCell<T: ReusableCellProtocol>(cell: T.Type) {
        self.register(UINib(nibName: cell.reuseIdentifier, bundle: nil),
                      forCellReuseIdentifier: cell.reuseIdentifier)
    }

    func registerCellClasses<T: ReusableCellProtocol>(_ classes: [T.Type]) {
        classes.forEach { (cellClass) in
            self.register(cellClass, forCellReuseIdentifier: cellClass.reuseIdentifier)
        }
    }


    // MARK:- Setup a cell with model
    func cellForModel<T: TableViewCellViewModelProtocol>(at: IndexPath, model: T) -> T.CellType {
        if let cell: T.CellType = dequeueReusableCell() {
            cell.setupModel(model: model)
            return cell
        }
        return T.CellType()
    }

    func dequeueReusableCell<T: ReusableCellProtocol>() -> T? {
        return self.dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T
    }


    // MARK:- Setup Cell Height
    func heightOfCellForModel<T: TableViewCellViewModelProtocol>(_ model: T) -> CGFloat {
        guard let className = cellClassNameForModel(type: model) as? T.Type else {
            return 0.0
        }
        return className.heightForCell(model)
    }

    func cellClassNameForModel<T: TableViewCellViewModelProtocol>(type: T) -> AnyClass {
        if type.isKind(of: T.self) {
            return T.CellType.classForCoder()
        }
        fatalError("This should never happen")
    }


    // MARK:- Adding cells to tableview
    func insertNewIndexPaths(_ newIndexPaths: [IndexPath]) {
        let maxYOffset: CGFloat = contentSize.height - frame.height //capture before inserting new rows

        //insert the new items into the table view
        performBatchUpdates({
            //insert new rows
            insertRows(at: newIndexPaths, with: .fade)
        }) { [weak self] (completed) in
            if (completed), let firstNewIndexPath = newIndexPaths.first {
                if ((maxYOffset - (self?.contentOffset.y ?? 0.0)) <= 20.0) {
                    self?.scrollToRow(at: firstNewIndexPath, at: .bottom, animated: true)
                }
            }
        }
    }


    // MARK:- Animation for tableview appearance
    func animateTableViewShowing() {
        if (self.alpha < 1.0) {
            UIView.animate(withDuration: 0.25, animations: {
                self.alpha = 1.0
            })
        }
    }
}
