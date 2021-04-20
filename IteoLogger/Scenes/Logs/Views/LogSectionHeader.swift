//
//  LogSectionHeader.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 11/02/2021.
//

import UIKit

final class LogSectionHeader: IteoLoggerXibHeaderFooterView {
    
    static let reuseIdentifier = String(describing: LogSectionHeader.self)
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    func setup(with title: String, date: String) {
        titleLabel.text = title.uppercased()
        dateLabel.text = date.uppercased()
    }
    
}
