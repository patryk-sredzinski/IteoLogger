//
//  SpinnerController.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//

import UIKit

final class SpinnerController: UIViewController {
    
    @IBOutlet private var blurView: UIVisualEffectView!
    
    var isDisappearing = false
    
    static func showOn(controller: UIViewController) {
        
        let spinnerController = SpinnerController(nibName: nil, bundle: .framework)
        spinnerController.view.alpha = 0
        controller.view.addSubview(spinnerController.view)
        spinnerController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spinnerController.view.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            spinnerController.view.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor),
            spinnerController.view.topAnchor.constraint(equalTo: controller.view.topAnchor),
            spinnerController.view.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor),
        ])
        controller.addChild(spinnerController)
        spinnerController.didMove(toParent: controller)
        UIView.animate(withDuration: .animationDuration) {
            spinnerController.view.alpha = 0.5
        }
    }
    
    static func hideFrom(controller: UIViewController) {
        
        guard let spinnerController = controller.children.first(where: { ($0 as? SpinnerController)?.isDisappearing == false }) as? SpinnerController else { return }
        spinnerController.isDisappearing = true

        UIView.animate(withDuration: .animationDuration, delay: 0, options: .beginFromCurrentState, animations: {
            spinnerController.view.alpha = 0
        }, completion: { _ in
            spinnerController.view.removeFromSuperview()
            spinnerController.removeFromParent()
        })
        
    }
    
}

private extension TimeInterval {
    
    static let animationDuration: TimeInterval = 0.3
    
}
