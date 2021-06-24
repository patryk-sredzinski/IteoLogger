//
//  IteoLoggerModule.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 15/01/2021.
//

import Foundation

public struct IteoLoggerModule: Codable, Equatable, Hashable {
    
    public let prefix: String
    public let name: String
    
    public static let network           = IteoLoggerModule("Network", prefix: "🌐")
    public static let networkRequest    = IteoLoggerModule("Request", prefix: "📤")
    public static let networkResponse   = IteoLoggerModule("Response", prefix: "📥")
    public static let webSocket         = IteoLoggerModule("WebSocket", prefix: "🔌")
    public static let voip              = IteoLoggerModule("VoIP", prefix: "📞")
    public static let webView           = IteoLoggerModule("WebView", prefix: "🖼")
    public static let userDefaults      = IteoLoggerModule("UserDefaults", prefix: "💾")
    public static let keyChain          = IteoLoggerModule("KeyChain", prefix: "🔑")
    public static let dataBase          = IteoLoggerModule("DataBase", prefix: "🗳")
    public static let screenView        = IteoLoggerModule("ScreenView", prefix: "📱")
    public static let layout            = IteoLoggerModule("Layout", prefix: "🖋")
    public static let auth              = IteoLoggerModule("Auth", prefix: "🛡")
    public static let background        = IteoLoggerModule("Background", prefix: "🐜")
    public static let calendar          = IteoLoggerModule("Calendar", prefix: "📅")
    public static let time              = IteoLoggerModule("Time", prefix: "⏰")
    public static let cache             = IteoLoggerModule("Cache", prefix: "💽")
    public static let bug               = IteoLoggerModule("Error", prefix: "🪲")
    public static let video             = IteoLoggerModule("Video", prefix: "🎬")
    public static let audio             = IteoLoggerModule("Audio", prefix: "🎵")
    public static let random            = IteoLoggerModule("Random", prefix: "🎲")
    public static let todo              = IteoLoggerModule("To do", prefix: "🔧")
    public static let payments          = IteoLoggerModule("Payments", prefix: "💰")
    public static let settings          = IteoLoggerModule("Settings", prefix: "⚙️")
    public static let map               = IteoLoggerModule("Map", prefix: "📍")
    public static let security          = IteoLoggerModule("Security", prefix: "🔐")
    public static let notifications     = IteoLoggerModule("Notifications", prefix: "🔔")
    public static let analytics         = IteoLoggerModule("Analytics", prefix: "📮")
    public static let bluetooth         = IteoLoggerModule("Bluetooth", prefix: "🧿")
    public static let watch             = IteoLoggerModule("Watch", prefix: "⌚️")
    public static let keyboard          = IteoLoggerModule("Keyboard", prefix: "⌨️")
    public static let widget            = IteoLoggerModule("Widget", prefix: "🌤")
    public static let augumentedReality = IteoLoggerModule("AR", prefix: "🫖")
    public static let games             = IteoLoggerModule("Games", prefix: "🕹")
    public static let graphics          = IteoLoggerModule("Graphics", prefix: "🌆")
    public static let motion            = IteoLoggerModule("Motion", prefix: "🚴")
    public static let push              = IteoLoggerModule("Push", prefix: "⚡️")
    public static let language          = IteoLoggerModule("Language", prefix: "👅")
    public static let configuration     = IteoLoggerModule("Configuration", prefix: "🎛")
    public static let environment       = IteoLoggerModule("Environment", prefix: "🌳")
    public static let deeplink          = IteoLoggerModule("Deeplink", prefix: "⛓")
    public static let unknown           = IteoLoggerModule("LOG", prefix: "🖊")

    public init(_ name: String, prefix: String = "✏️") {
        self.name = name
        self.prefix = prefix
    }
    
}
