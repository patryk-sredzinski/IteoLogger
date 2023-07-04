//
//  URL+LogsPath.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 08/02/2021.
//

import Foundation

enum FileManagerError: Error {
    case appGroupSetButNotValid
}

extension FileManager {
    
    func getLogsUrl(directoryName: String, appGroup: String) throws -> URL {
        let documentPath: URL
        if !appGroup.isEmpty {
            let containerUrl = containerURL(forSecurityApplicationGroupIdentifier: appGroup)
            guard let containerUrl else {
                throw FileManagerError.appGroupSetButNotValid
            }
            documentPath = containerUrl
        } else {
            documentPath = try url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        }
        let logsDirectoryUrl = documentPath.appendingPathComponent(directoryName, isDirectory: true)
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
