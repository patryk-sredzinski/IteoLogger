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
    private static let defaultConsoleFormat = "[level] [[time]] - [module_prefix] [module_name]: [output]"
    private static let defaultShareFormat = "[level] [[date] [time]] - [module_prefix] [module_name]: [output]"

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
    func displayLogs(logsDirectoryName: String? = nil, shareFormat: String? = nil) {
        presentLogs(logsDirectoryName: logsDirectoryName, shareFormat: shareFormat)
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
    public static let `default` = IteoLogger(consumers: [
        IteoLoggerConsoleItemConsumer(consoleFormat: defaultConsoleFormat),
        IteoLoggerStorageItemConsumer(logsDirectoryName: defaultLogsDirectoryName)
    ])
    
}

private extension IteoLogger {

    private func getIndex() -> UInt {
        logIndex += 1
        return logIndex
    }

    private func log(level: IteoLoggerLevel, module: IteoLoggerModule, items: [Any?]) {
        
        let logItem = IteoLoggerItem(index: getIndex(), date: Date(), module: module, level: level, output: items.toString)
        
        consumers.forEach { consumer in
            consumer.consumeLog(logItem)
        }
        
    }

    private func presentLogs(logsDirectoryName: String? = nil, shareFormat: String? = nil) {

        guard consumers.contains(where: { $0 is IteoLoggerStorageItemConsumer }) else {
            assertionFailure("IteoLoggerStorageItemConsumer is not added to the logger, so there's no point of displaying logs page")
            return
        }

        let logsDirectoryName = logsDirectoryName ?? Self.defaultLogsDirectoryName
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

        let controller = LogsControllerCreator().getController(logsDirectoryName: logsDirectoryName, shareFormat: shareFormat)
        rootViewController.present(controller, animated: true, completion: nil)

    }
    
}
