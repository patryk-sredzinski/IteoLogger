//
//  Bundle+Framework.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//

import Foundation

extension Bundle {
    
    #if SWIFT_PACKAGE
    static let framework = Bundle.module
    #else
    static let framework = Bundle(for: IteoLogger.self)
    #endif
    
}
