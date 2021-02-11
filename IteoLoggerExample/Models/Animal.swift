//
//  Animal.swift
//  IteoLoggerExample
//
//  Created by Patryk Średziński on 05/02/2021.
//

import Foundation

final class Animal: Codable {
    let name: String
    let age: UInt8
    
    init(name: String, age: UInt8) {
        self.name = name
        self.age = age
    }
}
