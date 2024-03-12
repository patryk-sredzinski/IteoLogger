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
    public static let network                       = IteoLoggerModule("Network" ,prefix: "🌐")

    /// Request - 📤
    public static let networkRequest                = IteoLoggerModule("Request" ,prefix: "📤")

    /// Response - 📥
    public static let networkResponse               = IteoLoggerModule("Response" ,prefix: "📥")

    /// WebSocket - 🔌
    public static let webSocket                     = IteoLoggerModule("WebSocket" ,prefix: "🔌")

    /// WebSocket Request - ↗️
    public static let webSocketRequest              = IteoLoggerModule("WebSocket Request" ,prefix: "↗️")

    /// WebSocket Response - ↘️
    public static let webSocketResponse             = IteoLoggerModule("WebSocket Response" ,prefix: "↘️")

    /// VoIP - 📞
    public static let voip                          = IteoLoggerModule("VoIP" ,prefix: "📞")

    /// WebView - 🖼
    public static let webView                       = IteoLoggerModule("Web View" ,prefix: "🖼")

    /// UserDefaults - 💾
    public static let userDefaults                  = IteoLoggerModule("User Defaults" ,prefix: "💾")

    /// KeyChain - 🔑
    public static let keyChain                      = IteoLoggerModule("KeyChain" ,prefix: "🔑")

    /// DataBase - 🗳
    public static let dataBase                      = IteoLoggerModule("DataBase" ,prefix: "🗳")

    /// Synchronizer - 🔄
    public static let synchronizer                  = IteoLoggerModule("Synchronizer" ,prefix: "🔄")

    /// ScreenView - 📱
    public static let screenView                    = IteoLoggerModule("Screen View" ,prefix: "📱")

    /// Layout - 🖋
    public static let layout                        = IteoLoggerModule("Layout" ,prefix: "🖋")

    /// Auth - 🛡
    public static let auth                          = IteoLoggerModule("Auth" ,prefix: "🛡")

    /// Background - 🐜
    public static let background                    = IteoLoggerModule("Background" ,prefix: "🐜")

    /// Calendar - 📅
    public static let calendar                      = IteoLoggerModule("Calendar" ,prefix: "📅")

    /// Time - ⏰
    public static let time                          = IteoLoggerModule("Time" ,prefix: "⏰")

    /// Cache - 💽
    public static let cache                         = IteoLoggerModule("Cache" ,prefix: "💽")

    /// Bug - 🪲
    public static let bug                           = IteoLoggerModule("Bug" ,prefix: "🪲")

    /// Camera - 📸
    public static let camera                        = IteoLoggerModule("Camera", prefix: "📸")

    /// Focus - 🌫
    public static let focus                         = IteoLoggerModule("Focus", prefix: "🌫")

    /// Exposure - ☀️
    public static let exposure                      = IteoLoggerModule("Exposure", prefix: "☀️")

    /// Zoom - 🔍
    public static let zoom                          = IteoLoggerModule("Zoom", prefix: "🔍")

    /// Stabilization - 〽️
    public static let stabilization                 = IteoLoggerModule("Stabilization", prefix: "〽️")

    /// Photo - 📸
    public static let photo                         = IteoLoggerModule("Photo" ,prefix: "📸")

    /// Video - 🎬
    public static let video                         = IteoLoggerModule("Video" ,prefix: "🎬")

    /// Audio - 🎵
    public static let audio                         = IteoLoggerModule("Audio" ,prefix: "🎵")

    /// Voice - 🎤
    public static let voice                         = IteoLoggerModule("Voice" ,prefix: "🎤")

    /// Gif - 🌠
    public static let gif                           = IteoLoggerModule("Gif" ,prefix: "🌠")

    /// Random - 🎲
    public static let random                        = IteoLoggerModule("Random" ,prefix: "🎲")

    /// To do - 🔧
    public static let todo                          = IteoLoggerModule("To do" ,prefix: "🔧")

    /// Payments - 💰
    public static let payments                      = IteoLoggerModule("Payments" ,prefix: "💰")

    /// Settings - ⚙️
    public static let settings                      = IteoLoggerModule("Settings" ,prefix: "⚙️")

    /// Map - 🗺
    public static let map                           = IteoLoggerModule("Map" ,prefix: "🗺")

    /// Clustering - 📍
    public static let clustering                    = IteoLoggerModule("Clustering" ,prefix: "📍")

    /// Security - 🔐
    public static let security                      = IteoLoggerModule("Security" ,prefix: "🔐")

    /// Notifications - 🔔
    public static let notifications                 = IteoLoggerModule("Notifications" ,prefix: "🔔")

    /// Analytics - 📮
    public static let analytics                     = IteoLoggerModule("Analytics" ,prefix: "📮")

    /// Bluetooth - 🧿
    public static let bluetooth                     = IteoLoggerModule("Bluetooth" ,prefix: "🧿")

    /// Watch - ⌚️
    public static let watch                         = IteoLoggerModule("Watch" ,prefix: "⌚️")

    /// Keyboard - ⌨️
    public static let keyboard                      = IteoLoggerModule("Keyboard" ,prefix: "⌨️")

    /// Widget - 🌤
    public static let widget                        = IteoLoggerModule("Widget" ,prefix: "🌤")

    /// AR - 🫖
    public static let augumentedReality             = IteoLoggerModule("AR" ,prefix: "🫖")

    /// Games - 🕹
    public static let games                         = IteoLoggerModule("Games" ,prefix: "🕹")

    /// Graphics - 🌆
    public static let graphics                      = IteoLoggerModule("Graphics" ,prefix: "🌆")

    /// Motion - 🚴
    public static let motion                        = IteoLoggerModule("Motion" ,prefix: "🚴")

    /// Push - ⚡️
    public static let push                          = IteoLoggerModule("Push" ,prefix: "⚡️")

    /// PushExtension - 🌩️
    public static let pushExtension                 = IteoLoggerModule("Push Extension" ,prefix: "🌩️")

    /// Language - 👅
    public static let language                      = IteoLoggerModule("Language" ,prefix: "👅")

    /// Configuration - 🎛
    public static let configuration                 = IteoLoggerModule("Configuration" ,prefix: "🎛")

    /// Environment - 🌳
    public static let environment                   = IteoLoggerModule("Environment" ,prefix: "🌳")

    /// Deeplink - ⛓
    public static let deeplink                      = IteoLoggerModule("Deeplink" ,prefix: "⛓")

    /// Link - 🔗
    public static let link                          = IteoLoggerModule("Link" ,prefix: "🔗")

    /// RichLink - 🗾
    public static let richlink                      = IteoLoggerModule("RichLink" ,prefix: "🗾")

    /// Call - 📞
    public static let call                          = IteoLoggerModule("Call" ,prefix: "📞")

    /// Contact - 📖
    public static let contact                       = IteoLoggerModule("Contact" ,prefix: "📖")

    /// Person - 🙎🏻‍♂️
    public static let person                        = IteoLoggerModule("Person" ,prefix: "🙎🏻‍♂️")

    /// Refresh - 🔁
    public static let refresh                       = IteoLoggerModule("Refresh" ,prefix: "🔁")

    /// Status - 🟢
    public static let status                        = IteoLoggerModule("Status" ,prefix: "🟢")

    /// Logout - ♿️
    public static let logout                        = IteoLoggerModule("Logout" ,prefix: "♿️")

    /// AppState - 🚀
    public static let appState                      = IteoLoggerModule("App State" ,prefix: "🚀")

    /// TableView - 📜
    public static let tableView                     = IteoLoggerModule("TableView" ,prefix: "📜")

    /// CollectionView - 💠
    public static let collectionView                = IteoLoggerModule("CollectionView" ,prefix: "💠")

    /// Editor - ✍🏻
    public static let editor                        = IteoLoggerModule("Editor" ,prefix: "✍🏻")

    /// Device - ⚙️
    public static let device                        = IteoLoggerModule("Device", prefix: "⚙️")

    /// Drop - 🦂
    public static let drop                          = IteoLoggerModule("Drop", prefix: "🦂")

    /// Writer - 💾
    public static let writer                        = IteoLoggerModule("Writer", prefix: "💾")

    /// Reader - 📖
    public static let reader                        = IteoLoggerModule("Reader", prefix: "📖")

    /// Metal - 📉
    public static let metal                         = IteoLoggerModule("Metal", prefix: "📉")

    /// Gallery - 🏙
    public static let gallery                       = IteoLoggerModule("Gallery", prefix: "🏙")

    /// Recorder - 🔴
    public static let recorder                      = IteoLoggerModule("Recorder", prefix: "🔴")

    /// Pressure - 🌡
    public static let pressure                      = IteoLoggerModule("Pressure", prefix: "🌡")

    /// Theme - 🎨
    public static let theme                         = IteoLoggerModule("Theme", prefix: "🎨")

    /// Manager - 🧑‍💼
    public static let manager                       = IteoLoggerModule("Manager", prefix: "🧑‍💼")

    /// Fetcher - 📡
    public static let fetcher                       = IteoLoggerModule("Fetcher", prefix: "📡")

    /// CellManager - 🫛
    public static let cellManager                   = IteoLoggerModule("Cell Manager", prefix: "🫛")

    /// TableManager - 📃
    public static let tableManager                  = IteoLoggerModule("Table Manager", prefix: "📃")

    /// Paginator - 📜
    public static let paginator                     = IteoLoggerModule("Paginator", prefix: "📜")

    /// System - 💻
    public static let system                        = IteoLoggerModule("System", prefix: "💻")

    /// Storage - 💽
    public static let storage                       = IteoLoggerModule("Storage", prefix: "💽")

    /// Clean Up - 🧹
    public static let cleanup                       = IteoLoggerModule("Clean Up", prefix: "🧹")

    /// Token - 📯
    public static let token                         = IteoLoggerModule("Token", prefix: "📯")

    /// Force Update - 🪓
    public static let forceUpdate                   = IteoLoggerModule("Force Update", prefix: "🪓")

    /// Media - 🎧
    public static let media                         = IteoLoggerModule("Media", prefix: "🎧")

    /// Observer - 👀
    public static let observer                      = IteoLoggerModule("Observer", prefix: "👀")

    /// Local - 🛖
    public static let local                         = IteoLoggerModule("Local", prefix: "🛖")

    /// Remote - ☁️
    public static let remote                        = IteoLoggerModule("Remote", prefix: "☁️")

    /// App Launch - ▶️
    public static let appLaunch                     = IteoLoggerModule("App Launch", prefix: "▶️")

    /// Search - 🔎
    public static let search                        = IteoLoggerModule("Search", prefix: "🔎")

    /// Memory - 📀
    public static let memory                        = IteoLoggerModule("Memory", prefix: "📀")

    /// Debug - 🪱
    public static let debug                         = IteoLoggerModule("Debug", prefix: "🪱")

    /// Localization - 👅
    public static let localization                  = IteoLoggerModule("Localization", prefix: "👅")

    /// Navigation - 🗺️
    public static let navigation                    = IteoLoggerModule("Navigation" ,prefix: "🗺️")

    /// Search History - 🔍
    public static let searchHistory                 = IteoLoggerModule("SearchHistory" ,prefix: "🔍")

    /// Weather - 🌦️
    public static let weather                       = IteoLoggerModule("Weather" ,prefix: "🌦️")

    /// Animations - 🎞️
    public static let animations                    = IteoLoggerModule("Animations" ,prefix: "🎞️")

    /// File Operations - 📂
    public static let fileOperations                = IteoLoggerModule("FileOperations" ,prefix: "📂")

    /// App Permissions - 🔐
    public static let appPermissions                = IteoLoggerModule("App Permissions" ,prefix: "🔐")

    /// Biometrics - 🤳
    public static let biometrics                    = IteoLoggerModule("Biometrics" ,prefix: "🤳")

    /// Health - ❤️
    public static let health                        = IteoLoggerModule("Health" ,prefix: "❤️")

    /// Fitness - 🏋️‍♂️
    public static let fitness                       = IteoLoggerModule("Fitness" ,prefix: "🏋️‍♂️")

    /// Notification Settings - 🔕
    public static let notificationSettings          = IteoLoggerModule("Notification Settings" ,prefix: "🔕")

    /// Task Scheduler - 🗓️
    public static let taskScheduler                 = IteoLoggerModule("Task Scheduler" ,prefix: "🗓️")

    /// App Updates - 🔄
    public static let appUpdates                    = IteoLoggerModule("App Updates" ,prefix: "🔄")

    /// User Feedback - 💬
    public static let userFeedback                  = IteoLoggerModule("User Feedback" ,prefix: "💬")

    /// Error Handling - ❌
    public static let errorHandling                 = IteoLoggerModule("Error Handling" ,prefix: "❌")

    /// In App Purchase - 💸
    public static let inAppPurchase                 = IteoLoggerModule("In App Purchase" ,prefix: "💸")

    /// Documents - 📄
    public static let documents                     = IteoLoggerModule("Documents" ,prefix: "📄")

    /// Network Connectivity - 🌐
    public static let networkConnectivity           = IteoLoggerModule("Network Connectivity" ,prefix: "🌐")

    /// Accessibility - ♿️
    public static let accessibility                 = IteoLoggerModule("Accessibility" ,prefix: "♿️")

    /// User Onboarding - 🚀
    public static let userOnboarding                = IteoLoggerModule("User Onboarding" ,prefix: "🚀")

    /// Debug Performance - ⏱️
    public static let debugPerformance              = IteoLoggerModule("Debug Performance" ,prefix: "⏱️")

    /// Connectivity - 📡
    public static let connectivity                  = IteoLoggerModule("Connectivity" ,prefix: "📡")

    /// Social Media - 📱
    public static let socialMedia                   = IteoLoggerModule("Social Media" ,prefix: "📱")

    /// Calendar Events - 📅
    public static let calendarEvents                = IteoLoggerModule("Calendar Events" ,prefix: "📅")

    /// Push Notification - 📬
    public static let pushNotification              = IteoLoggerModule("Push Notification" ,prefix: "📬")

    /// Location - 📍
    public static let location                      = IteoLoggerModule("Location" ,prefix: "📍")

    /// QRC ode - 📷
    public static let qrCode                        = IteoLoggerModule("QR Code" ,prefix: "📷")

    /// Chat Messages - 💬
    public static let chatMessages                  = IteoLoggerModule("Chat Messages" ,prefix: "💬")

    /// Shopping Cart - 🛒
    public static let shoppingCart                  = IteoLoggerModule("Shopping Cart" ,prefix: "🛒")

    /// Emoji Reactions - 😄
    public static let emojiReactions                = IteoLoggerModule("Emoji Reactions" ,prefix: "😄")

    /// Dark Mode - 🌙
    public static let darkMode                      = IteoLoggerModule("Dark Mode" ,prefix: "🌙")

    /// Chat Support - 🤖
    public static let chatSupport                   = IteoLoggerModule("Chat Support" ,prefix: "🤖")

    /// ARKit - 🌐
    public static let arKit                         = IteoLoggerModule("ARKit" ,prefix: "🌐")

    /// Facial Recognition - 👤
    public static let facialRecognition             = IteoLoggerModule("Facial Recognition" ,prefix: "👤")

    /// App Rating - ⭐️
    public static let appRating                     = IteoLoggerModule("App Rating" ,prefix: "⭐️")

    /// Handwriting Recognition - ✍️
    public static let handwritingRecognition        = IteoLoggerModule("Handwriting Recognition" ,prefix: "✍️")

    /// Augmented Audio - 🎧
    public static let augmentedAudio                = IteoLoggerModule("Augmented Audio" ,prefix: "🎧")

    /// Code Scanner - 📟
    public static let codeScanner                   = IteoLoggerModule("Code Scanner" ,prefix: "📟")

    /// Feed - 📰
    public static let feed                          = IteoLoggerModule("Feed" ,prefix: "📰")

    /// Collaboration - 🤝
    public static let collaboration                 = IteoLoggerModule("Collaboration" ,prefix: "🤝")

    /// Password Manager - 🔒
    public static let passwordManager               = IteoLoggerModule("Password Manager" ,prefix: "🔒")
   
    /// Sustainability - 🌱
    public static let sustainability                = IteoLoggerModule("Sustainability" ,prefix: "🌱")
    
     /// Connection - 🪺
     public static let connection                   = IteoLoggerModule("Connection" ,prefix: "🪺")
    
    /// LOG - 🖊
    public static let unknown                       = IteoLoggerModule("LOG" ,prefix: "🖊")

    public let prefix: String
    public let name: String

}
