//
//  IteoLoggerLevel.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 15/01/2021.
//

import Foundation

/**
 Levels that determine what kind of log it is.
 */
public enum IteoLoggerLevel: String, Codable, Hashable, CaseIterable {
    /// marked with: 📕
    case error

    /// marked with: 📙
    case warning

    /// marked with: 📗
    case success

    /// marked with: 📘
    case info

    var icon: String {
        switch self {
        case .error:
            return "📕"
        case .warning:
            return "📙"
        case .success:
            return "📗"
        case .info:
            return "📘"
        }
    }
}
