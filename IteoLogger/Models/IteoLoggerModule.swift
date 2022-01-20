//
//  IteoLoggerModule.swift
//  IteoLogger
//
//  Created by Patryk Średziński on 15/01/2021.
//

import Foundation

/**
Modules that determine what kind of log it is.
*/
public struct IteoLoggerModule: Codable, Equatable, Hashable {

    /**
     Initializes custom module that can be used in app.
     - Parameters:
        - name: long name that describes the module
        - prefix: short emoji, that is noticeable and recognizable
     - Returns: a new module
    */
    public init(_ name: String, prefix: String = "✏️") {
        self.name = name
        self.prefix = prefix
    }

    /// Network - 🌐
    public static let network           = IteoLoggerModule("Network" ,prefix: "🌐")

    /// Request - 📤
    public static let networkRequest    = IteoLoggerModule("Request" ,prefix: "📤")

    /// Response - 📥
    public static let networkResponse   = IteoLoggerModule("Response" ,prefix: "📥")

    /// WebSocket - 🔌
    public static let webSocket         = IteoLoggerModule("WebSocket" ,prefix: "🔌")

    /// VoIP - 📞
    public static let voip              = IteoLoggerModule("VoIP" ,prefix: "📞")

    /// WebView - 🖼
    public static let webView           = IteoLoggerModule("WebView" ,prefix: "🖼")

    /// UserDefaults - 💾
    public static let userDefaults      = IteoLoggerModule("UserDefaults" ,prefix: "💾")

    /// KeyChain - 🔑
    public static let keyChain          = IteoLoggerModule("KeyChain" ,prefix: "🔑")

    /// DataBase - 🗳
    public static let dataBase          = IteoLoggerModule("DataBase" ,prefix: "🗳")

    /// ScreenView - 📱
    public static let screenView        = IteoLoggerModule("ScreenView" ,prefix: "📱")

    /// Layout - 🖋
    public static let layout            = IteoLoggerModule("Layout" ,prefix: "🖋")

    /// Auth - 🛡
    public static let auth              = IteoLoggerModule("Auth" ,prefix: "🛡")

    /// Background - 🐜
    public static let background        = IteoLoggerModule("Background" ,prefix: "🐜")

    /// Calendar - 📅
    public static let calendar          = IteoLoggerModule("Calendar" ,prefix: "📅")

    /// Time - ⏰
    public static let time              = IteoLoggerModule("Time" ,prefix: "⏰")

    /// Cache - 💽
    public static let cache             = IteoLoggerModule("Cache" ,prefix: "💽")

    /// Bug - 🪲
    public static let bug               = IteoLoggerModule("Bug" ,prefix: "🪲")

    /// Camera - 📸
    public static let camera           = IteoLoggerModule("Camera", prefix: "📸")

    /// Focus - 🌫
    public static let focus             = IteoLoggerModule("Focus", prefix: "🌫")

    /// Exposure - ☀️
    public static let exposure          = IteoLoggerModule("Exposure", prefix: "☀️")

    /// Zoom - 🔍
    public static let zoom              = IteoLoggerModule("Zoom", prefix: "🔍")

    /// Stabilization - 〽️
    public static let stabilization    = IteoLoggerModule("Stabilization", prefix: "〽️")

    /// Photo - 📸
    public static let photo             = IteoLoggerModule("Photo" ,prefix: "📸")

    /// Video - 🎬
    public static let video             = IteoLoggerModule("Video" ,prefix: "🎬")

    /// Audio - 🎵
    public static let audio             = IteoLoggerModule("Audio" ,prefix: "🎵")

    /// Random - 🎲
    public static let random            = IteoLoggerModule("Random" ,prefix: "🎲")

    /// To do - 🔧
    public static let todo              = IteoLoggerModule("To do" ,prefix: "🔧")

    /// Payments - 💰
    public static let payments          = IteoLoggerModule("Payments" ,prefix: "💰")

    /// Settings - ⚙️
    public static let settings          = IteoLoggerModule("Settings" ,prefix: "⚙️")

    /// Map - 📍
    public static let map               = IteoLoggerModule("Map" ,prefix: "📍")

    /// Security - 🔐
    public static let security          = IteoLoggerModule("Security" ,prefix: "🔐")

    /// Notifications - 🔔
    public static let notifications     = IteoLoggerModule("Notifications" ,prefix: "🔔")

    /// Analytics - 📮
    public static let analytics         = IteoLoggerModule("Analytics" ,prefix: "📮")

    /// Bluetooth - 🧿
    public static let bluetooth         = IteoLoggerModule("Bluetooth" ,prefix: "🧿")

    /// Watch - ⌚️
    public static let watch             = IteoLoggerModule("Watch" ,prefix: "⌚️")

    /// Keyboard - ⌨️
    public static let keyboard          = IteoLoggerModule("Keyboard" ,prefix: "⌨️")

    /// Widget - 🌤
    public static let widget            = IteoLoggerModule("Widget" ,prefix: "🌤")

    /// AR - 🫖
    public static let augumentedReality = IteoLoggerModule("AR" ,prefix: "🫖")

    /// Games - 🕹
    public static let games             = IteoLoggerModule("Games" ,prefix: "🕹")

    /// Graphics - 🌆
    public static let graphics          = IteoLoggerModule("Graphics" ,prefix: "🌆")

    /// Motion - 🚴
    public static let motion            = IteoLoggerModule("Motion" ,prefix: "🚴")

    /// Push - ⚡️
    public static let push              = IteoLoggerModule("Push" ,prefix: "⚡️")

    /// Language - 👅
    public static let language          = IteoLoggerModule("Language" ,prefix: "👅")

    /// Configuration - 🎛
    public static let configuration     = IteoLoggerModule("Configuration" ,prefix: "🎛")

    /// Environment - 🌳
    public static let environment       = IteoLoggerModule("Environment" ,prefix: "🌳")

    /// Deeplink - ⛓
    public static let deeplink          = IteoLoggerModule("Deeplink" ,prefix: "⛓")

    /// Call - 📞
    public static let call              = IteoLoggerModule("Call" ,prefix: "📞")

    /// Contact - 📖
    public static let contact           = IteoLoggerModule("Contact" ,prefix: "📖")

    /// Person - 🙎🏻‍♂️
    public static let person            = IteoLoggerModule("Person" ,prefix: "🙎🏻‍♂️")

    /// Refresh - 🔁
    public static let refresh           = IteoLoggerModule("Refresh" ,prefix: "🔁")

    /// Status - 🟢
    public static let status            = IteoLoggerModule("Status" ,prefix: "🟢")

    /// Logout - ♿️
    public static let logout            = IteoLoggerModule("Logout" ,prefix: "♿️")

    /// AppState - 🚀
    public static let appState          = IteoLoggerModule("AppState" ,prefix: "🚀")

    /// TableView - 📜
    public static let tableView         = IteoLoggerModule("TableView" ,prefix: "📜")

    /// CollectionView - 💠
    public static let collectionView    = IteoLoggerModule("CollectionView" ,prefix: "💠")

    /// Editor - ✍🏻
    public static let editor            = IteoLoggerModule("Editor" ,prefix: "✍🏻")

    /// Device - ⚙️
    public static let device            = IteoLoggerModule("Device", prefix: "⚙️")

    /// Drop - 🦂
    public static let drop              = IteoLoggerModule("Drop", prefix: "🦂")

    /// Writer - 💾
    public static let writer            = IteoLoggerModule("Writer", prefix: "💾")

    /// Reader - 💾
    public static let reader            = IteoLoggerModule("Reader", prefix: "📖")

    /// Metal - 📉
    public static let metal             = IteoLoggerModule("Metal", prefix: "📉")

    /// Gallery - 🏙
    public static let gallery           = IteoLoggerModule("Gallery", prefix: "🏙")

    /// Recorder - 🔴
    public static let recorder          = IteoLoggerModule("Recorder", prefix: "🔴")

    /// Pressure - 🌡
    public static let pressure          = IteoLoggerModule("Pressure", prefix: "🌡")

    /// LOG - 🖊
    public static let unknown           = IteoLoggerModule("LOG" ,prefix: "🖊")

    public let prefix: String
    public let name: String

}
