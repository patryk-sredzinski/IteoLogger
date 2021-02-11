//
//  IteoLoggerItem.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 15/01/2021.
//

import Foundation

public struct IteoLoggerItem: Codable {
    
    let index: UInt
    let date: Date
    let module: IteoLoggerModule
    let level: IteoLoggerLevel
    let output: String
    
}

extension IteoLoggerItem {
    
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
