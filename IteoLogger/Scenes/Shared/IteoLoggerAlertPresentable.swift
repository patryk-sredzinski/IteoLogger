//
//  IteoLoggerAlertPresentable.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//

import UIKit

protocol IteoLoggerAlertPresentable: UIViewController {
    
    func showAlert(title: String?,
                   body: String?,
                   leftTitle: String?,
                   leftAction: SimpleAction?,
                   rightTitle: String?,
                   rightAction: SimpleAction?)

}

extension IteoLoggerAlertPresentable {
    
    func showAlert(title: String? = nil,
                   body: String? = nil,
                   leftTitle: String? = nil,
                   leftAction: SimpleAction? = nil,
                   rightTitle: String? = nil,
                   rightAction: SimpleAction? = nil) {
        
        let alert = UIAlertController(title: title, message: body, preferredStyle: .alert)
        if let leftTitle = leftTitle {
            let action = UIAlertAction(title: leftTitle, style: .default) { _ in
                leftAction?()
            }
            alert.addAction(action)
        }
        if let rightTitle = rightTitle {
            let action = UIAlertAction(title: rightTitle, style: .default) { _ in
                rightAction?()
            }
            alert.addAction(action)
        }
        presentController(alert, animated: true)
    }
    
    private func presentController(_ controller: UIViewController, animated: Bool) {
        present(controller, animated: animated, completion: nil)
        UISelectionFeedbackGenerator().selectionChanged()
    }
        
}
