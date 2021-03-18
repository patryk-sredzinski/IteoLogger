//
//  IteoLoggerConsoleItemConsumer.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation

final public class IteoLoggerConsoleItemConsumer: IteoLoggerItemConsumer {
    
    private let consoleFormat: String
    private let dateFormatter = DateFormatManager.shared
    
    public init(consoleFormat: String = "[level] [[time]] - [module_prefix] [module_name]: [output]") {
        self.consoleFormat = consoleFormat
    }

    public func consumeLog(_ logItem: IteoLoggerItem) {
        print(logItem.toString(consoleFormat, dateFormatter: dateFormatter))
    }
    
}
