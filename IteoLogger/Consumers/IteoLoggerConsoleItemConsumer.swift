//
//  IteoLoggerConsoleItemConsumer.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation

/**
Default consumer that logs items in the console.
*/
final public class IteoLoggerConsoleItemConsumer: IteoLoggerItemConsumer {
    
    private let consoleFormat: String
    private let dateFormatter = DateFormatManager.shared

    /**
     Initializes console consumer with console format.
     - Parameters:
        - consoleFormat: format to be displayed in the console. Default: *"[level] [[time]] - [module_prefix] [module_name]: [output]"*.
     - Returns: a new console consumer.
    */
    public init(consoleFormat: String = "[level] [[time]] - [module_prefix] [module_name]: [output]") {
        self.consoleFormat = consoleFormat
    }

    public func consumeLog(_ logItem: IteoLoggerItem) {
        print(logItem.toString(consoleFormat, dateFormatter: dateFormatter))
    }
    
}
