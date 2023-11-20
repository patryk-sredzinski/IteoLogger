//
//  IteoLoggerSystemItemConsumer.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation
import os

/**
Default consumer that logs items in the system logger.
*/
@available(iOS 14.0, *)
final public class IteoLoggerSystemItemConsumer: IteoLoggerItemConsumer {
    
    private let consoleFormat: String
    private let dateFormatter = DateFormatManager.shared

    /**
     Initializes console consumer with console format.
     - Parameters:
        - consoleFormat: format to be displayed in the console. Default: *"[level] [[time]] - [module_prefix] [module_name]: [output]"*.
     - Returns: a new console consumer.
    */
    public init(consoleFormat: String = "[level] [framework] [module_prefix] [module_name]: [output]") {
        self.consoleFormat = consoleFormat
    }

    public func consumeLog(_ logItem: IteoLoggerItem) {
        let logger = Logger(subsystem: logItem.framework, category: logItem.module.name)
        let log = logItem.toString(consoleFormat, dateFormatter: dateFormatter)
        switch logItem.level {
        case .error:
            logger.fault("\(log)")
        case .warning:
            logger.warning("\(log)")
        case .success:
            logger.trace("\(log)")
        case .info:
            logger.info("\(log)")
        }
    }
}
