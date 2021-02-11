//
//  SpinnerPresentable.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//

import UIKit

protocol SpinnerPresentable: UIViewController {
    
    func toggleSpinner(_ state: Bool)

}

extension SpinnerPresentable {

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



private extension SpinnerPresentable {

    func setSpinnerVisible(_ state: Bool) {
        if state {
            SpinnerController.showOn(controller: self)
        } else {
            SpinnerController.hideFrom(controller: self)
        }
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
}

