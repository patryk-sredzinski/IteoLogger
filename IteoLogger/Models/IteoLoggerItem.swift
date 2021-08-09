//
//  IteoLoggerItem.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 15/01/2021.
//

import Foundation

/**
Main class. Used across the whole SDK.
*/
public struct IteoLoggerItem: Codable {

    /// Automatically incremented index
    public let index: UInt

    /// Date when the log has been created
    public let date: Date

    /// Module used to filter and group logs
    public let module: IteoLoggerModule

    /// One of four available levels (info, success, warning, error) used to filter and group logs
    public let level: IteoLoggerLevel

    /// Stringified log output
    public let output: String
    
}

internal extension IteoLoggerItem {
    
    func toString(_ format: String, dateFormatter: DateFormatManager) -> String {
        
        let currentTime = date
        let date = dateFormatter.string(from: currentTime, format: .dateOnly)
        let time = dateFormatter.string(from: currentTime, format: .timeOnly)
        
        return format.replacingOccurrences(of: "[date]", with: date)
            .replacingOccurrences(of: "[time]", with: time)
            .replacingOccurrences(of: "[level]", with: level.icon)
            .replacingOccurrences(of: "[module_prefix]", with: module.prefix)
            .replacingOccurrences(of: "[module_name]", with: module.name)
            .replacingOccurrences(of: "[output]", with: output)
            .replacingOccurrences(of: "[index]", with: "\(index)")

    }
    
}
