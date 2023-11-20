//
//  LogsWorker.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 05/02/2021.
//  Copyright (c) 2021 iteo. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates by Patryk Średziński
//

import UIKit

enum LogsWorkerErrors: Error {
    case stringToDataFailed
}

protocol LogsWorker {
    
    var availableFrameworks: Set<String> { get }
    var availableModules: Set<IteoLoggerModule> { get }
    var availableLevels: Set<IteoLoggerLevel> { get }

    func loadFilters() -> LogFilter
    func loadedSessionsCount() -> Int
    func loadLogs(at index: Int, filter: LogFilter) -> [IteoLoggerItem]
    func deleteLogs()
    func prepareShareData(sessions: [LogSectionItem]) -> (header: String, fileUrl: URL)

}

final class LogsWorkerImpl {
    
    private let logsDirectoryName: String
    private let logsAppGroup: String
    private let shareFormat: String
    private let jsonDecoder: JSONDecoder
    private let fileManager: FileManager
    private let dateFormatter = DateFormatManager.shared
    private let byteFormatter: ByteCountFormatter
    private let userDefaults: UserDefaults

    private var availableSessionPaths: [String]?
    private(set) var availableFrameworks = Set<String>()
    private(set) var availableModules = Set<IteoLoggerModule>()
    private(set) var availableLevels = Set<IteoLoggerLevel>()

    init(logsDirectoryName: String,
         logsAppGroup: String,
         shareFormat: String,
         jsonDecoder: JSONDecoder = JSONDecoder(),
         fileManager: FileManager = FileManager.default,
         byteFormatter: ByteCountFormatter = ByteCountFormatter(),
         userDefaults: UserDefaults = UserDefaults.standard) {
        self.logsDirectoryName = logsDirectoryName
        self.logsAppGroup = logsAppGroup
        self.shareFormat = shareFormat
        self.jsonDecoder = jsonDecoder
        self.fileManager = fileManager
        self.byteFormatter = byteFormatter
        self.userDefaults = userDefaults
    }
    
}

extension LogsWorkerImpl: LogsWorker {

    func loadFilters() -> LogFilter {
        if let data = userDefaults.data(forKey: LogFilter.userDefaultsKey),
           let filter = try? jsonDecoder.decode(LogFilter.self, from: data) {
            return filter
        }
        return LogFilter()
    }

    func loadedSessionsCount() -> Int {
        return (availableSessionPaths ?? []).count
    }
    
    func loadLogs(at index: Int, filter: LogFilter) -> [IteoLoggerItem] {
        let sessionPaths = availableSessionPaths ?? loadAvailableSessions()
        guard index < sessionPaths.count else { return [] }
        let logs = loadLogFile(at: sessionPaths[index])
        updateAvailableFilterData(for: logs, filter: filter)
        return logs.filter { filter.match($0) }
    }
    
    func deleteLogs() {
        deleteLogDirectory()
        availableSessionPaths = nil
    }
    
    func prepareShareData(sessions: [LogSectionItem]) -> (header: String, fileUrl: URL) {
        var logString = ""
        
        logString += "DEVICE: \(UIDevice.modelName)"
        logString += "\n"
        logString += "SYSTEM VERSION: \(UIDevice.current.systemVersion)"
        logString += "\n"
        logString += "APPLICATION VERSION: \(UIApplication.versionBuild)"

        sessions.forEach { sessionItem in
            logString += "\n"
            logString += "SESSION #\(sessionItem.index) - \(sessionItem.date)"
            logString += "\n"

            sessionItem.items.forEach { cellItem in
                if case .log(let item) = cellItem {
                    logString += item.toString(shareFormat, dateFormatter: DateFormatManager.shared)
                    logString += "\n"
                }
            }
        }
        let logData = logString.data(using: .utf8)
        let logSize = Int64(logData?.count ?? 0)
        let shareDateString = dateFormatter.string(from: Date(), format: .fullDate)
        let startDateString = sessions.last?.date ?? shareDateString
        let byteString = byteFormatter.string(fromByteCount: logSize)
        let logHeader = "Logs generated at \(shareDateString), since: \(startDateString), \(sessions.count) sessions, size: \(byteString)"
       
        let fileUrl = getTemporaryFileUrl(name: "\(shareDateString) | \(startDateString) | \(sessions.count) sessions.log")
        
        do {
            try logData?.write(to: fileUrl)
        } catch {
            return (logHeader, fileUrl)
        }
         
        return (logHeader, fileUrl)
    }
}

private extension LogsWorkerImpl {
    
    private func loadAvailableSessions() -> [String] {
        do {
            availableSessionPaths = try loadAvailableSessionsPaths()
        } catch {
            availableSessionPaths = []
            assertionFailure(error.localizedDescription)
        }
        return availableSessionPaths ?? []
    }
    
    private func loadAvailableSessionsPaths() throws -> [String] {
        
        let logsDirectoryUrl = try fileManager.getLogsUrl(directoryName: logsDirectoryName,
                                                          appGroup: logsAppGroup)
        let files = try fileManager.contentsOfDirectory(atPath: logsDirectoryUrl.path)
        return files.sorted().reversed()
        
    }
    
    private func loadLogFile(at path: String) -> [IteoLoggerItem] {
        do {
            let logsDirectoryUrl = try fileManager.getLogsUrl(directoryName: logsDirectoryName,
                                                              appGroup: logsAppGroup)
            
            let logUrl = logsDirectoryUrl.appendingPathComponent(path)
            let logContent = try String(contentsOf: logUrl)
            let jsonLog = "[\(logContent)]"
            
            guard let jsonData = jsonLog.data(using: .utf8) else {
                throw LogsWorkerErrors.stringToDataFailed
            }
            
            let logItems = try jsonDecoder.decode([IteoLoggerItem].self, from: jsonData)
            return logItems.reversed()
        } catch {
            assertionFailure(error.localizedDescription)
            return []
        }
        
    }
    
    private func deleteLogDirectory() {
        do {
            let logsDirectoryUrl = try fileManager.getLogsUrl(directoryName: logsDirectoryName,
                                                              appGroup: logsAppGroup)
            try fileManager.removeItem(at: logsDirectoryUrl)
        } catch {
            assertionFailure(error.localizedDescription)
        }
    }
    
    private func updateAvailableFilterData(for logs: [IteoLoggerItem], filter: LogFilter) {
        let uniqueFrameworks = Set(logs.map { $0.framework })
        uniqueFrameworks.forEach {
            availableFrameworks.insert($0)
        }
        let uniqueLevels = Set(logs.map { $0.level })
        uniqueLevels.forEach {
            availableLevels.insert($0)
        }
        let uniqueModules = Set(logs.map { $0.module })
        uniqueModules.forEach {
            availableModules.insert($0)
        }
    }
    
    private func getTemporaryFileUrl(name: String) -> URL {
        do {
            let temporaryFileUrl = try fileManager.getTemporaryFileUrl(name)
            return temporaryFileUrl
        } catch {
            assertionFailure(error.localizedDescription)
            return URL(fileURLWithPath: "")
        }
    }

}
