//
//  IteoLogger.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation
import UIKit

public extension IteoLogger {
    
    private static let defaultLogsDirectoryName = "IteoLoggerLogData"
    private static var defaultLogsAppGroup = ""
    private static let defaultConsoleFormat = "[level] [module_prefix] [[time]] [framework] - [module_name]: [output]"
    private static let defaultShareFormat = "[level] [iso] [module_prefix] [framework] - [module_name]: [output]"
    private static let defaultSystemFormat = "[level] [module_prefix] [framework] - [module_name]: [output]"

    /**
     Sends data to logger to be consumed by consumers passed in *IteoLogger* initializer.

     - Parameters:
     - items: items to be logged
     */
    func log(_ items: Any?...) {
        log(level: .info, module: .unknown, items: items)
    }

    /**
     Sends data to logger to be consumed by consumers passed in *IteoLogger* initializer.

     - Parameters:
     - module: one of default modules, or a custom one, used for filtering and grouping logs.
     - items: items to be logged
     */
    func log(_ module: IteoLoggerModule, _ items: Any?...) {
        log(level: .info, module: module, items: items)
    }

    /**
     Sends data to logger to be consumed by consumers passed in *IteoLogger* initializer.

     - Parameters:
     - level: one of default levels (info, success, warning, error), used for filtering and grouping logs.
     - items: items to be logged
     */
    func log(_ level: IteoLoggerLevel, _ items: Any?...) {
        log(level: level, module: .unknown, items: items)
    }

    /**
     Sends data to logger to be consumed by consumers passed in *IteoLogger* initializer.

     - Parameters:
     - module: one of default modules, or a custom one, used for filtering and grouping logs.
     - level: one of default levels (info, success, warning, error), used for filtering and grouping logs.
     - items: items to be logged
     */
    func log(_ module: IteoLoggerModule, _ level: IteoLoggerLevel, _ items: Any?...) {
        log(level: level, module: module, items: items)
    }

    /**
     Sends data to logger to be consumed by consumers passed in *IteoLogger* initializer.

     - Parameters:
     - level: one of default levels (info, success, warning, error), used for filtering and grouping logs.
     - module: one of default modules, or a custom one, used for filtering and grouping logs.
     - items: items to be logged
     */
    func log(_ level: IteoLoggerLevel, _ module: IteoLoggerModule, _ items: Any?...) {
        log(level: level, module: module, items: items)
    }

    /**
     Displays a full page view with logs that were stored with an use of *IteoLoggerStorageItemConsumer*.

     - Parameters:
     - logsDirectoryName: optional directory name where logs are stored.
     - shareFormat: string format which is used when user wants to share logs with someone.
     - Note: Use the same *logsDirectoryName* in *IteoLoggerStorageItemConsumer* to see results. Default shareFormat is: *[level] [[date] [time]] - [module_prefix] [module_name]: [output]* You can use these parameters in your own format to fill it with data.
     */
    @available(iOSApplicationExtension, unavailable)
    func displayLogs(logsDirectoryName: String? = nil, logsAppGroup: String? = nil, shareFormat: String? = nil) {
        presentLogs(logsDirectoryName: logsDirectoryName, logsAppGroup: logsAppGroup, shareFormat: shareFormat)
    }
    
    /**
     Saves logs on the drive
     
     - Parameters:
     - logsDirectoryName: optional directory name where logs are stored.
     - Note: Use the same *logsDirectoryName* in *IteoLoggerStorageItemConsumer* to see results. Default shareFormat is: *[level] [[date] [time]] - [module_prefix] [module_name]: [output]* You can use these parameters in your own format to fill it with data.
     */
    func exportLogs(sessionCount: Int = 5, logsDirectoryName: String? = nil, logsAppGroup: String? = nil, shareFormat: String? = nil) -> URL {
        return saveLogs(sessionCount: sessionCount, logsDirectoryName: logsDirectoryName, logsAppGroup: logsAppGroup, shareFormat: shareFormat)
    }
}

/**
 This main class is responsible for all logger functionalities.
 */
final public class IteoLogger {
    
    private var logIndex: UInt = 0
    private var consumers: [IteoLoggerItemConsumer]

    /**
     Initializes logger instance with customized logger consumers.
     - Parameters:
     -  consumers: list of consumers that will be called on every log action.
     - Returns: a new logger instance with custom consumers.
     */
    public init(consumers: [IteoLoggerItemConsumer]) {
        self.consumers = consumers
    }

    /**
     Initializes logger instance with default logger consumer.
     - Parameters:
     - consumers: list of consumers that will be called on every log action.
     - Returns: a new logger instance with Console and Storage consumers.
     */
    public static let `default`: IteoLogger = {
        var consumers = [IteoLoggerItemConsumer]()
        if #available(iOS 14.0, *) {
            consumers.append(IteoLoggerSystemItemConsumer(consoleFormat: defaultSystemFormat))
        } else {
            consumers.append(IteoLoggerConsoleItemConsumer(consoleFormat: defaultConsoleFormat))
        }
        consumers.append(IteoLoggerStorageItemConsumer(logsDirectoryName: defaultLogsDirectoryName,
                                                       logsAppGroup: defaultLogsAppGroup))
        return IteoLogger(consumers: consumers)
    }()
    
    public static func setDefaultLogsAppGroup(_ newValue: String) {
        defaultLogsAppGroup = newValue
    }
    
    public func startNewSession() {
        (consumers.first(where: { $0 is IteoLoggerStorageItemConsumer }) as? IteoLoggerStorageItemConsumer)?.startNewSession()
    }
    
}

private extension IteoLogger {
    
    private func getIndex() -> UInt {
        logIndex += 1
        return logIndex
    }
    
    private func log(level: IteoLoggerLevel, module: IteoLoggerModule, items: [Any?]) {
        
        let logItem = IteoLoggerItem(index: getIndex(),
                                     date: Date(),
                                     module: module,
                                     level: level,
                                     output: Self.toString(array: items),
                                     framework: getOriginalFrameworkName())
        
        consumers.forEach { consumer in
            consumer.consumeLog(logItem)
        }
        
    }
    
    @available(iOSApplicationExtension, unavailable)
    private func presentLogs(logsDirectoryName: String? = nil, logsAppGroup: String? = nil, shareFormat: String? = nil) {
        
        guard consumers.contains(where: { $0 is IteoLoggerStorageItemConsumer }) else {
            assertionFailure("IteoLoggerStorageItemConsumer is not added to the logger, so there's no point of displaying logs page")
            return
        }
        
        let logsDirectoryName = logsDirectoryName ?? Self.defaultLogsDirectoryName
        let logsAppGroup = logsAppGroup ?? Self.defaultLogsAppGroup
        let shareFormat = shareFormat ?? Self.defaultShareFormat
        
        var rootController: UIViewController?
        if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            if let windowScene = scenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
               let window = windowScene.windows.first,
               let rootViewController = window.rootViewController {
                rootController = rootViewController
            }
        } else if let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController {
            rootController = rootViewController
        }
        guard let rootViewController = rootController else {
            assertionFailure("Could not find root controller")
            return
        }
        
        let controller = LogsControllerCreator().getController(logsDirectoryName: logsDirectoryName,
                                                               logsAppGroup: logsAppGroup,
                                                               shareFormat: shareFormat)
        rootViewController.present(controller, animated: true, completion: nil)
        
    }
    
    private func saveLogs(sessionCount: Int, logsDirectoryName: String? = nil, logsAppGroup: String? = nil, shareFormat: String? = nil) -> URL {
        let logsDirectoryName = logsDirectoryName ?? Self.defaultLogsDirectoryName
        let logsAppGroup = logsAppGroup ?? Self.defaultLogsAppGroup
        let shareFormat = shareFormat ?? Self.defaultShareFormat
        
        let worker: LogsWorker = LogsWorkerImpl(logsDirectoryName: logsDirectoryName,
                                                logsAppGroup: logsAppGroup,
                                                shareFormat: shareFormat)
        let filter = LogFilter()
        var sections = [LogSectionItem]()
        for i in 0..<sessionCount {
            let logData = worker.loadLogs(at: i, filter: filter)
            let cellItems = logData.map { LogCellItem.log(item: $0) }
            let section = LogSectionItem(index: i, date: "\(i)", items: cellItems)
            sections.append(section)
        }
        let shareData = worker.prepareShareData(sessions: sections)
        return shareData.fileUrl
    }
}

private extension IteoLogger {
    private func getOriginalFrameworkName() -> String {
        var loggerFrameworkName: String = (Bundle(for: Self.self).infoDictionary?["CFBundleName"] as? String) ?? "IteoLogger"
        loggerFrameworkName = loggerFrameworkName.replacingOccurrences(of: "PackageProduct", with: "Package")
        let stackList: [String] = Thread.callStackSymbols.compactMap {
            let splitData = $0.split(separator: " ")
            guard splitData.count == 6 else { return nil }
            return String(splitData[1].split(separator: ".")[0])
        }
        return stackList
            .filter { $0 != "???" && !$0.starts(with: loggerFrameworkName) }
            .first ?? ""
    }
}
