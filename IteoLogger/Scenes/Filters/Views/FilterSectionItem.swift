//
//  FilterSectionItem.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 18/01/2021.
//

import Foundation

enum FilterSectionType: String {
    case frameworks
    case levels
    case modules
}

struct FilterSectionItem {
    let type: FilterSectionType
    let items: [FilterCellItem]
}

enum FilterCellItem {
    case framework(item: String, selected: Bool)
    case level(item: IteoLoggerLevel, selected: Bool)
    case module(item: IteoLoggerModule, selected: Bool)
}
