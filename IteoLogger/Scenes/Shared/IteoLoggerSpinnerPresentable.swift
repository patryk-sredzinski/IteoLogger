//
//  IteoLoggerSpinnerPresentable.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//

import UIKit

protocol IteoLoggerSpinnerPresentable: UIViewController {
    
    func toggleSpinner(_ state: Bool)

}

extension IteoLoggerSpinnerPresentable {

    func toggleSpinner(_ state: Bool) {
        if !Thread.isMainThread {
            DispatchQueue.main.async {
                self.setSpinnerVisible(state)
            }
        } else {
            setSpinnerVisible(state)
        }
    }
    
}



private extension IteoLoggerSpinnerPresentable {

    func setSpinnerVisible(_ state: Bool) {
        if state {
            IteoLoggerSpinnerController.showOn(controller: self)
        } else {
            IteoLoggerSpinnerController.hideFrom(controller: self)
        }
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
}

