//
//  FilterSectionHeader.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 11/02/2021.
//

import UIKit

final class FilterSectionHeader: IteoLoggerXibHeaderFooterView {
    
    static let reuseIdentifier = String(describing: FilterSectionHeader.self)
    
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var actionLabel: UILabel!
    
    private var buttonAction: SimpleAction?
    
    func setup(with title: String, buttonTitle: String, action: SimpleAction?) {
        backgroundColor = .systemBackground
        titleLabel.textColor = .secondaryLabel
        actionLabel.textColor = .systemOrange
        
        titleLabel.text = title.uppercased()
        actionLabel.text = buttonTitle
        buttonAction = action
    }
    
}

private extension FilterSectionHeader {
    
    @IBAction private func actionButtonTapped() {
        buttonAction?()
    }
    
}
