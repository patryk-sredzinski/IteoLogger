//
//  IteoLoggerItemConsumer.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

/**
 Allows you to create your own consumers (for example a consumer that sends logs somewhere).
*/
public protocol IteoLoggerItemConsumer {
    
    /**
     Implement this method and handle log. This method is called everytime a *log* function is called.
     - Parameters:
        - logItem: an item to be consumed
    */
    func consumeLog(_ logItem: IteoLoggerItem)
    
}
