//
//  Person.swift
//  IteoLoggerExample
//
//  Created by Patryk Średziński on 05/02/2021.
//

struct Person: Codable {
    let firstName: String
    let lastName: String
    let cars: [Car]
}
