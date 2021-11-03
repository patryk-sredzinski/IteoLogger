//
//  Application.swift
//  IteoLogger
//
//  Created by Eryk Chrustek on 03/11/2021.
//

import UIKit

extension UIApplication {

    static let versionBuild: String = {
        guard let version = appVersion(), let build = appBuild() else { return "CAN'T GET APPLICATION VERSION" }
        return version == build ? "v\(version)" : "v\(version)(\(build))"
    }()

}

private extension UIApplication {

    private static let CFBundleShortVersionString = "CFBundleShortVersionString"

    private static func appVersion() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: CFBundleShortVersionString) as? String
    }

    private static func appBuild() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }

}
