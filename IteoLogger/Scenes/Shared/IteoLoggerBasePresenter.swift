//
//  BasePresentable.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//

typealias SimpleAction = () -> Void

protocol IteoLoggerSpinnerPresenter {
    func toggleSpinner(_ state: Bool)
}

protocol IteoLoggerAlertPresenter {
    func showAlert(title: String?,
                   body: String?,
                   leftTitle: String?,
                   leftAction: SimpleAction?,
                   rightTitle: String?,
                   rightAction: SimpleAction?)
    func showError(_ error: Error)
}

class IteoLoggerBasePresenter<T: IteoLoggerSpinnerPresentable & IteoLoggerAlertPresentable>: IteoLoggerSpinnerPresenter, IteoLoggerAlertPresenter {
    
    weak var controller: T?

    func toggleSpinner(_ state: Bool) {
        controller?.toggleSpinner(state)
    }
    
    func showAlert(title: String?, body: String?, leftTitle: String?, leftAction: SimpleAction?, rightTitle: String?, rightAction: SimpleAction?) {
        controller?.showAlert(title: title, body: body, leftTitle: leftTitle, leftAction: leftAction, rightTitle: rightTitle, rightAction: rightAction)
    }
    
    func showError(_ error: Error) {
        controller?.showAlert(body: error.localizedDescription, leftTitle: "✔")
    }
    
}
