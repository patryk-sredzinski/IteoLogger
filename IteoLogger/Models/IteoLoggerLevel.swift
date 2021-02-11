//
//  IteoLoggerLevel.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 15/01/2021.
//

import Foundation

public enum IteoLoggerLevel: String, Codable, Hashable, CaseIterable, Identifiable {
    
    public var id: String { rawValue }
    
    case error
    case warning
    case success
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
