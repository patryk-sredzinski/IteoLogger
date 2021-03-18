//
//  URL+LogsPath.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 08/02/2021.
//

import Foundation

extension FileManager {
    
    func getLogsUrl(_ logsDirectoryName: String) throws -> URL {
        
        let documentPath = try url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let logsDirectoryUrl = documentPath.appendingPathComponent(logsDirectoryName, isDirectory: true)
        var isDirectory : ObjCBool = true
        if !fileExists(atPath: logsDirectoryUrl.path, isDirectory: &isDirectory) {
            try createDirectory(atPath: logsDirectoryUrl.path, withIntermediateDirectories: false, attributes: nil)
        }
        return logsDirectoryUrl
        
    }
    
    func getTemporaryFileUrl(_ name: String) throws -> URL {
        let documentPath = try url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let temporaryFileUrl = documentPath.appendingPathComponent(name, isDirectory: false)
        return temporaryFileUrl
    }

}
