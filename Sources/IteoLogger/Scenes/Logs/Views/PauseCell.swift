//
//  PauseCell.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 20/01/2021.
//

import UIKit

@objc(PauseCell)
final class PauseCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: PauseCell.self)
    
    @IBOutlet private var cellHeight: NSLayoutConstraint!
    
    func setup(with length: TimeInterval) {
        let newHeight: CGFloat
        if length >= 10 && length < 60 {
            newHeight = 10
        } else if length >= 60 && length < 600 {
            newHeight = 25
        } else {
            newHeight = 40
        }
        cellHeight.constant = newHeight
        layoutIfNeeded()
    }
}
