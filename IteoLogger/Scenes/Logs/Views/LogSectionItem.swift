//
//  LogSectionItem.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 18/01/2021.
//

import Foundation

struct LogSectionItem {
    let index: Int
    let date: String
    let items: [LogCellItem]
}

enum LogCellItem {
    case log(item: IteoLoggerItem)
    case pause(length: TimeInterval)
}
