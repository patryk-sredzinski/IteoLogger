//
//  IteoLoggerStorageItemConsumer.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation
/**
Default consumer that saves logs in phone directory, available to be read and displayed in *LoggerPage*.
*/
final public class IteoLoggerStorageItemConsumer: IteoLoggerItemConsumer {
    
    private let logsDirectoryName: String
    private let logsAppGroup: String
    private let jsonEncoder: JSONEncoder
    private let fileManager: FileManager
    private let dateFormatter = DateFormatManager.shared
    private let currentSessionFileName: String
    private let savingQueue: DispatchQueue

    /**
     Initializes storage  consumer in specified directory.
     - Parameters:
        - logsDirectoryName: custom directory where logs should be stored
        - logsAppGroup: set app group if you want to share logs between extensions
        - jsonEncoder: custom JSONEncoder, in case you'd like to store logs differently
        - fileManager: you can use custom *FileManager•
        - savingQueue: queue on which you'd like to have all saving operatiobs
     - Returns: a new storage consumer.
    */
    public init(logsDirectoryName: String,
                logsAppGroup: String,
                jsonEncoder: JSONEncoder = JSONEncoder(),
                fileManager: FileManager = FileManager.default,
                savingQueue: DispatchQueue = DispatchQueue(label: "saving_queue", qos: .utility, attributes: [], autoreleaseFrequency: .inherit, target: nil)) {
        self.logsDirectoryName = logsDirectoryName
        self.logsAppGroup = logsAppGroup
        self.jsonEncoder = jsonEncoder
        self.fileManager = fileManager
        self.savingQueue = savingQueue
        self.currentSessionFileName = "\(dateFormatter.string(from: Date(), format: .logFormat))".appending(".log")
    }
    
    public func consumeLog(_ logItem: IteoLoggerItem) {
        savingQueue.async { [self] in
            do {
                let logUrl = try fileManager.getLogsUrl(directoryName: logsDirectoryName,
                                                        appGroup: logsAppGroup)
                    .appendingPathComponent(currentSessionFileName)
                try append(logItem, filePath: logUrl)
            } catch {
                assertionFailure("Failed to store IteoLoggerItem in .log file: \(error)")
            }
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
        if #available(iOS 13.4, *) {
            try file.seekToEnd()
            try file.write(contentsOf: dataToLog)
        } else {
            file.write(dataToLog)
            file.closeFile()
        }
    }
    
}
