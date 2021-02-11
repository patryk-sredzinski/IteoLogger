//
//  IteoLoggerStorageItemConsumer.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation

final public class IteoLoggerStorageItemConsumer: IteoLoggerItemConsumer {
    
    private let logsDirectoryName: String
    private let jsonEncoder: JSONEncoder
    private let fileManager: FileManager
    private let dateFormatter = DateFormatManager.shared
    private let currentSessionFileName: String
    
    public init(logsDirectoryName: String,
         jsonEncoder: JSONEncoder = JSONEncoder(),
         fileManager: FileManager = FileManager.default) {
        self.logsDirectoryName = logsDirectoryName
        self.jsonEncoder = jsonEncoder
        self.fileManager = fileManager
        self.currentSessionFileName = "\(dateFormatter.string(from: Date(), format: .logFormat))".appending(".log")
    }
    
    public func consumeLog(_ logItem: IteoLoggerItem) {
        do {
            let logUrl = try fileManager.getLogsUrl(logsDirectoryName).appendingPathComponent(currentSessionFileName)
            try append(logItem, filePath: logUrl)
        } catch {
            assertionFailure("Failed to store IteoLoggerItem in .log file: \(error)")
        }
    }
    
}

private extension IteoLoggerStorageItemConsumer {
    
    private func append(_ logItem: IteoLoggerItem, filePath: URL) throws {
        
        var dataToLog = try jsonEncoder.encode(logItem)
        dataToLog.append(contentsOf: [0x2C])
        
        if !fileManager.fileExists(atPath: filePath.path) {
            fileManager.createFile(atPath: filePath.path, contents: nil, attributes: nil)
        }
        
        let file = try FileHandle(forWritingTo: filePath)
        file.seekToEndOfFile()
        file.write(dataToLog)
        file.closeFile()
        
    }
    
}
