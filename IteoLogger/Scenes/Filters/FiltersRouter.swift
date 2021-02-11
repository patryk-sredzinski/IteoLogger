//
//  FiltersRouter.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//  Copyright (c) 2021 iteo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

protocol FiltersRouterDelegate: class {
    func saveFilters(_ filters: LogFilter)
}

protocol FiltersRouter {
    func saveFilters(_ filters: LogFilter)
}

final class FiltersRouterImpl {
    weak var controller: BaseViewController?
    weak var delegate: FiltersRouterDelegate?
}

extension FiltersRouterImpl: FiltersRouter {
    
    func saveFilters(_ filters: LogFilter) {
        delegate?.saveFilters(filters)
        controller?.dismiss(animated: true, completion: nil)
    }
    
}
