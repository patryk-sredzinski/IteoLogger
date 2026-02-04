//
//  LogFilter.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 08/02/2021.
//

import Foundation

/// Represents a filter selection that can either include all items (including future ones) or a specific set.
enum FilterSelection<T: Codable & Hashable>: Codable, Equatable {
    /// All items pass through, including newly added ones
    case all
    /// Only the specified items pass through
    case selected(Set<T>)
    
    /// Returns true if this selection contains the given item
    func contains(_ item: T) -> Bool {
        switch self {
        case .all:
            return true
        case .selected(let set):
            return set.contains(item)
        }
    }
    
    /// Returns true if all items from the available set are selected
    func isAllSelected(from available: Set<T>) -> Bool {
        switch self {
        case .all:
            return true
        case .selected(let set):
            return set == available
        }
    }
    
    /// Returns the selected items, or all available if `.all`
    func selectedItems(from available: Set<T>) -> Set<T> {
        switch self {
        case .all:
            return available
        case .selected(let set):
            return set
        }
    }
    
    /// Returns true if the selection is `.all`
    var isAll: Bool {
        if case .all = self {
            return true
        }
        return false
    }
    
    /// Returns true if nothing is selected (empty set in `.selected` case)
    var isEmpty: Bool {
        switch self {
        case .all:
            return false
        case .selected(let set):
            return set.isEmpty
        }
    }
}

struct LogFilter: Codable {

    static var userDefaultsKey = "log_filter"

    var frameworks: FilterSelection<String> = .all
    var levels: FilterSelection<IteoLoggerLevel> = .all
    var modules: FilterSelection<IteoLoggerModule> = .all
    
    var isSet: Bool {
        return !frameworks.isAll || !levels.isAll || !modules.isAll
    }
    
    func match(_ log: IteoLoggerItem) -> Bool {
        return levels.contains(log.level) && modules.contains(log.module) && frameworks.contains(log.framework)
    }
    
}
