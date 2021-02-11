//
//  DateFormatManager.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation

enum DateFormats: String {
    case fullDate = "dd.MM.yyyy HH:mm:ss"
    case dateOnly = "dd.MM.yyyy"
    case timeOnly = "HH:mm:ss"
    case logFormat = "yyyyMMddHHmmss"
    case iso
}

final class DateFormatManager {

    static let shared = DateFormatManager()
    
    private lazy var dateFormatter = DateFormatter()
    private lazy var isoFormatter = ISO8601DateFormatter()
    
    func string(from date: Date, format: DateFormats = .fullDate) -> String {
        if case .iso = format {
            return isoFormatter.string(from: date)
        }
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: date)
    }
    
}
