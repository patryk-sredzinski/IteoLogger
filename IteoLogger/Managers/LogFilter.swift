//
//  LogFilter.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 08/02/2021.
//

import Foundation

struct LogFilter: Codable {

    static var userDefaultsKey = "log_filter"

    var frameworks = Set<String>()
    var levels = Set<IteoLoggerLevel>()
    var modules = Set<IteoLoggerModule>()
    
    var isSet: Bool {
        return !frameworks.isEmpty || !levels.isEmpty || !modules.isEmpty
    }
    
    func match(_ log: IteoLoggerItem) -> Bool {
        return !isSet || (levels.contains(log.level) && modules.contains(log.module) && frameworks.contains(log.framework))
    }
    
}
