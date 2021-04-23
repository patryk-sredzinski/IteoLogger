//
//  IteoLogger.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 04/02/2021.
//

import Foundation
import UIKit

public extension IteoLogger {
    
    static let defaultLogsDirectoryName = "IteoLoggerLogData"
    static let defaultConsoleFormat = "[level] [[time]] - [module_prefix] [module_name]: [output]"
    static let defaultShareFormat = "[level] [[date] [time]] - [module_prefix] [module_name]: [output]"
    
    func log(_ items: Any?...) {
        log(level: .info, module: .unknown, items: items)
    }
    
    func log(_ module: IteoLoggerModule, _ items: Any?...) {
        log(level: .info, module: module, items: items)
    }
    
    func log(_ level: IteoLoggerLevel, _ items: Any?...) {
        log(level: level, module: .unknown, items: items)
    }
    
    func log(_ module: IteoLoggerModule, _ level: IteoLoggerLevel, _ items: Any?...) {
        log(level: level, module: module, items: items)
    }
    
    func log(_ level: IteoLoggerLevel, _ module: IteoLoggerModule, _ items: Any?...) {
        log(level: level, module: module, items: items)
    }
    
    func displayLogs(logsDirectoryName: String = defaultLogsDirectoryName, shareFormat: String = defaultShareFormat) {
        guard consumers.contains(where: { $0 is IteoLoggerStorageItemConsumer }) else {
            assertionFailure("IteoLoggerStorageItemConsumer is not added to the logger, so there's no point of displaying logs page")
            return
        }
        var rootController: UIViewController?
        if let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController {
            rootController = rootViewController
        } else if #available(iOS 13.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            if let windowScene = scenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
               let window = windowScene.windows.first,
               let rootViewController = window.rootViewController {
                rootController = rootViewController
            }
        }
        guard let rootViewController = rootController else {
            assertionFailure("Could not find root controller")
            return
        }
        rootViewController.present(LogsControllerCreator().getController(logsDirectoryName: logsDirectoryName, shareFormat: shareFormat),
                                   animated: true,
                                   completion: nil)
    }
    
}

final public class IteoLogger {
    
    private var logIndex: UInt = 0
    
    private func getIndex() -> UInt {
        logIndex += 1
        return logIndex
    }
    
    private var consumers: [IteoLoggerItemConsumer]
    
    public init(consumers: [IteoLoggerItemConsumer]) {
        self.consumers = consumers
    }
    
    public static let `default` = IteoLogger(consumers: [
        IteoLoggerConsoleItemConsumer(consoleFormat: defaultConsoleFormat),
        IteoLoggerStorageItemConsumer(logsDirectoryName: defaultLogsDirectoryName)
    ])
    
}

private extension IteoLogger {
    
    private func log(level: IteoLoggerLevel, module: IteoLoggerModule, items: [Any?]) {
        
        let logItem = IteoLoggerItem(index: getIndex(), date: Date(), module: module, level: level, output: items.toString)
        
        consumers.forEach { consumer in
            consumer.consumeLog(logItem)
        }
        
    }
    
}
