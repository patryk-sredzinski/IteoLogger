//
//  LogsRouter.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//  Copyright (c) 2021 iteo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

protocol LogsRouter {
    func displaySharingController(_ logString: String)
    func displayFilters(_ filters: LogFilter,
                        availableModules: Set<IteoLoggerModule>,
                        availableLevels: Set<IteoLoggerLevel>,
                        delegate: FiltersRouterDelegate?)
}

final class LogsRouterImpl {
    weak var controller: BaseViewController?
}

extension LogsRouterImpl: LogsRouter {

    func displaySharingController(_ logString: String) {
        let activityController = UIActivityViewController(activityItems: [logString], applicationActivities: nil)
        controller?.present(activityController, animated: true, completion: nil)
    }
    
    func displayFilters(_ filters: LogFilter,
                        availableModules: Set<IteoLoggerModule>,
                        availableLevels: Set<IteoLoggerLevel>,
                        delegate: FiltersRouterDelegate?) {
        let filterToSend = filters.isSet ? filters : LogFilter(levels: availableLevels, modules: availableModules)
        let filterController = FiltersControllerCreator().getController(filter: filterToSend,
                                                                        availableModules: availableModules,
                                                                        availableLevels: availableLevels,
                                                                        delegate: delegate)
        controller?.present(filterController, animated: true, completion: nil)
    }
    
}
