//
//  AnyArray+String.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation

extension IteoLogger {
    static func toString(array: [Any?]) -> String {
        let stringItems = array.map(toString(item:))
        return stringItems.joined(separator: "\n")
    }
    
    private static func toString(item: Any?) -> String {
        guard let itemSet = item else {
            return "nil"
        }
        
        if let codableItem = item as? Encodable,
           let jsonObject = try? codableItem.toJson(),
           let jsonString = String(data: jsonObject, encoding: .utf8) {
            return jsonString
        }
        
        if let dictionaryItem = itemSet as? [String: Any],
           let jsonObject = try? JSONSerialization.data(withJSONObject: dictionaryItem, options: .prettyPrinted),
           let jsonString = String(data: jsonObject, encoding: .utf8) {
            return jsonString
        }
        
        if let arrayItem = itemSet as? [Any?] {
            return "[\n\(arrayItem.map(toString(item:)).joined(separator: ",\n"))\n]"
        }
        
        return "\(itemSet)"
    }
}

private extension Encodable {
    func toJson(_ encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        let encodedData = try encoder.encode(self)
        let json = try JSONSerialization.jsonObject(with: encodedData)
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        return jsonData
    }
}
