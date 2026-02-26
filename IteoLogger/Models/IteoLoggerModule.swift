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
    public static let network = IteoLoggerModule("Network", prefix: "🌐")

    /// Request - 📤
    public static let networkRequest = IteoLoggerModule("Request", prefix: "📤")

    /// Response - 📥
    public static let networkResponse = IteoLoggerModule("Response", prefix: "📥")

    /// WebSocket - 🔌
    public static let webSocket = IteoLoggerModule("WebSocket", prefix: "🔌")

    /// WebSocket Request - ↗️
    public static let webSocketRequest = IteoLoggerModule("WebSocket Request", prefix: "↗️")

    /// WebSocket Response - ↘️
    public static let webSocketResponse = IteoLoggerModule("WebSocket Response", prefix: "↘️")

    /// VoIP - 📞
    public static let voip = IteoLoggerModule("VoIP", prefix: "📞")

    /// WebView - 🖼
    public static let webView = IteoLoggerModule("Web View", prefix: "🖼")

    /// UserDefaults - 💾
    public static let userDefaults = IteoLoggerModule("User Defaults", prefix: "💾")

    /// KeyChain - 🔑
    public static let keyChain = IteoLoggerModule("KeyChain", prefix: "🔑")

    /// DataBase - 🗳
    public static let dataBase = IteoLoggerModule("DataBase", prefix: "🗳")

    /// Synchronizer - 🔄
    public static let synchronizer = IteoLoggerModule("Synchronizer", prefix: "🔄")

    /// ScreenView - 📱
    public static let screenView = IteoLoggerModule("Screen View", prefix: "📱")

    /// Layout - 🖋
    public static let layout = IteoLoggerModule("Layout", prefix: "🖋")

    /// Auth - 🛡
    public static let auth = IteoLoggerModule("Auth", prefix: "🛡")

    /// Background - 🐜
    public static let background = IteoLoggerModule("Background", prefix: "🐜")

    /// Calendar - 📅
    public static let calendar = IteoLoggerModule("Calendar", prefix: "📅")

    /// Time - ⏰
    public static let time = IteoLoggerModule("Time", prefix: "⏰")

    /// Cache - 💽
    public static let cache = IteoLoggerModule("Cache", prefix: "💽")

    /// Bug - 🪲
    public static let bug = IteoLoggerModule("Bug", prefix: "🪲")

    /// Camera - 📸
    public static let camera = IteoLoggerModule("Camera", prefix: "📸")

    /// Focus - 🌫
    public static let focus = IteoLoggerModule("Focus", prefix: "🌫")

    /// Exposure - ☀️
    public static let exposure = IteoLoggerModule("Exposure", prefix: "☀️")

    /// Zoom - 🔍
    public static let zoom = IteoLoggerModule("Zoom", prefix: "🔍")

    /// Stabilization - 〽️
    public static let stabilization = IteoLoggerModule("Stabilization", prefix: "〽️")

    /// Photo - 📸
    public static let photo = IteoLoggerModule("Photo", prefix: "📸")

    /// Video - 🎬
    public static let video = IteoLoggerModule("Video", prefix: "🎬")

    /// Audio - 🎵
    public static let audio = IteoLoggerModule("Audio", prefix: "🎵")

    /// Voice - 🎤
    public static let voice = IteoLoggerModule("Voice", prefix: "🎤")

    /// Gif - 🌠
    public static let gif = IteoLoggerModule("Gif", prefix: "🌠")

    /// Random - 🎲
    public static let random = IteoLoggerModule("Random", prefix: "🎲")

    /// To do - 🔧
    public static let todo = IteoLoggerModule("To do", prefix: "🔧")

    /// Payments - 💰
    public static let payments = IteoLoggerModule("Payments", prefix: "💰")

    /// Settings - ⚙️
    public static let settings = IteoLoggerModule("Settings", prefix: "⚙️")

    /// Map - 🗺
    public static let map = IteoLoggerModule("Map", prefix: "🗺")

    /// Clustering - 📍
    public static let clustering = IteoLoggerModule("Clustering", prefix: "📍")

    /// Security - 🔐
    public static let security = IteoLoggerModule("Security", prefix: "🔐")

    /// Notifications - 🔔
    public static let notifications = IteoLoggerModule("Notifications", prefix: "🔔")

    /// Analytics - 📮
    public static let analytics = IteoLoggerModule("Analytics", prefix: "📮")

    /// Bluetooth - 🧿
    public static let bluetooth = IteoLoggerModule("Bluetooth", prefix: "🧿")

    /// Watch - ⌚️
    public static let watch = IteoLoggerModule("Watch", prefix: "⌚️")

    /// Keyboard - ⌨️
    public static let keyboard = IteoLoggerModule("Keyboard", prefix: "⌨️")

    /// Widget - 🌤
    public static let widget = IteoLoggerModule("Widget", prefix: "🌤")

    /// AR - 🫖
    public static let augumentedReality = IteoLoggerModule("AR", prefix: "🫖")

    /// Games - 🕹
    public static let games = IteoLoggerModule("Games", prefix: "🕹")

    /// Graphics - 🌆
    public static let graphics = IteoLoggerModule("Graphics", prefix: "🌆")

    /// Motion - 🚴
    public static let motion = IteoLoggerModule("Motion", prefix: "🚴")

    /// Push - ⚡️
    public static let push = IteoLoggerModule("Push", prefix: "⚡️")

    /// PushExtension - 🌩️
    public static let pushExtension = IteoLoggerModule("Push Extension", prefix: "🌩️")

    /// Language - 👅
    public static let language = IteoLoggerModule("Language", prefix: "👅")

    /// Configuration - 🎛
    public static let configuration = IteoLoggerModule("Configuration", prefix: "🎛")

    /// Environment - 🌳
    public static let environment = IteoLoggerModule("Environment", prefix: "🌳")

    /// Deeplink - ⛓
    public static let deeplink = IteoLoggerModule("Deeplink", prefix: "⛓")

    /// Link - 🔗
    public static let link = IteoLoggerModule("Link", prefix: "🔗")

    /// RichLink - 🗾
    public static let richlink = IteoLoggerModule("RichLink", prefix: "🗾")

    /// Call - 📞
    public static let call = IteoLoggerModule("Call", prefix: "📞")

    /// Contact - 📖
    public static let contact = IteoLoggerModule("Contact", prefix: "📖")

    /// Person - 🙎🏻‍♂️
    public static let person = IteoLoggerModule("Person", prefix: "🙎🏻‍♂️")

    /// Refresh - 🔁
    public static let refresh = IteoLoggerModule("Refresh", prefix: "🔁")

    /// Status - 🟢
    public static let status = IteoLoggerModule("Status", prefix: "🟢")

    /// Logout - ♿️
    public static let logout = IteoLoggerModule("Logout", prefix: "♿️")

    /// AppState - 🚀
    public static let appState = IteoLoggerModule("App State", prefix: "🚀")

    /// TableView - 📜
    public static let tableView = IteoLoggerModule("TableView", prefix: "📜")

    /// CollectionView - 💠
    public static let collectionView = IteoLoggerModule("CollectionView", prefix: "💠")

    /// ScrollView - 📰
    public static let scrollView = IteoLoggerModule("ScrollView", prefix: "📰")

    /// Insets - 🧈
    public static let insets = IteoLoggerModule("Insets", prefix: "🧈")

    /// Editor - ✍🏻
    public static let editor = IteoLoggerModule("Editor", prefix: "✍🏻")

    /// Device - ⚙️
    public static let device = IteoLoggerModule("Device", prefix: "⚙️")

    /// Drop - 🦂
    public static let drop = IteoLoggerModule("Drop", prefix: "🦂")

    /// Writer - 💾
    public static let writer = IteoLoggerModule("Writer", prefix: "💾")

    /// Reader - 📖
    public static let reader = IteoLoggerModule("Reader", prefix: "📖")

    /// Metal - 📉
    public static let metal = IteoLoggerModule("Metal", prefix: "📉")

    /// Gallery - 🏙
    public static let gallery = IteoLoggerModule("Gallery", prefix: "🏙")

    /// Recorder - 🔴
    public static let recorder = IteoLoggerModule("Recorder", prefix: "🔴")

    /// Pressure - 🌡
    public static let pressure = IteoLoggerModule("Pressure", prefix: "🌡")

    /// Theme - 🎨
    public static let theme = IteoLoggerModule("Theme", prefix: "🎨")

    /// Manager - 🧑‍💼
    public static let manager = IteoLoggerModule("Manager", prefix: "🧑‍💼")

    /// Fetcher - 📡
    public static let fetcher = IteoLoggerModule("Fetcher", prefix: "📡")

    /// CellManager - 🫛
    public static let cellManager = IteoLoggerModule("Cell Manager", prefix: "🫛")

    /// TableManager - 📃
    public static let tableManager = IteoLoggerModule("Table Manager", prefix: "📃")

    /// Paginator - 📜
    public static let paginator = IteoLoggerModule("Paginator", prefix: "📜")

    /// System - 💻
    public static let system = IteoLoggerModule("System", prefix: "💻")

    /// Storage - 💽
    public static let storage = IteoLoggerModule("Storage", prefix: "💽")

    /// Clean Up - 🧹
    public static let cleanup = IteoLoggerModule("Clean Up", prefix: "🧹")

    /// Token - 📯
    public static let token = IteoLoggerModule("Token", prefix: "📯")

    /// Force Update - 🪓
    public static let forceUpdate = IteoLoggerModule("Force Update", prefix: "🪓")

    /// Media - 🎧
    public static let media = IteoLoggerModule("Media", prefix: "🎧")

    /// Observer - 👀
    public static let observer = IteoLoggerModule("Observer", prefix: "👀")

    /// Local - 🛖
    public static let local = IteoLoggerModule("Local", prefix: "🛖")

    /// Remote - ☁️
    public static let remote = IteoLoggerModule("Remote", prefix: "☁️")

    /// App Launch - ▶️
    public static let appLaunch = IteoLoggerModule("App Launch", prefix: "▶️")

    /// Search - 🔎
    public static let search = IteoLoggerModule("Search", prefix: "🔎")

    /// Memory - 📀
    public static let memory = IteoLoggerModule("Memory", prefix: "📀")

    /// Debug - 🪱
    public static let debug = IteoLoggerModule("Debug", prefix: "🪱")

    /// Localization - 👅
    public static let localization = IteoLoggerModule("Localization", prefix: "👅")

    /// Navigation - 🗺️
    public static let navigation = IteoLoggerModule("Navigation", prefix: "🗺️")

    /// Search History - 🔍
    public static let searchHistory = IteoLoggerModule("SearchHistory", prefix: "🔍")

    /// Weather - 🌦️
    public static let weather = IteoLoggerModule("Weather", prefix: "🌦️")

    /// Animations - 🎞️
    public static let animations = IteoLoggerModule("Animations", prefix: "🎞️")

    /// File Operations - 📂
    public static let fileOperations = IteoLoggerModule("FileOperations", prefix: "📂")

    /// App Permissions - 🔐
    public static let appPermissions = IteoLoggerModule("App Permissions", prefix: "🔐")

    /// Biometrics - 🤳
    public static let biometrics = IteoLoggerModule("Biometrics", prefix: "🤳")

    /// Health - ❤️
    public static let health = IteoLoggerModule("Health", prefix: "❤️")

    /// Fitness - 🏋️‍♂️
    public static let fitness = IteoLoggerModule("Fitness", prefix: "🏋️‍♂️")

    /// Notification Settings - 🔕
    public static let notificationSettings = IteoLoggerModule("Notification Settings", prefix: "🔕")

    /// Task Scheduler - 🗓️
    public static let taskScheduler = IteoLoggerModule("Task Scheduler", prefix: "🗓️")

    /// App Updates - 🔄
    public static let appUpdates = IteoLoggerModule("App Updates", prefix: "🔄")

    /// User Feedback - 💬
    public static let userFeedback = IteoLoggerModule("User Feedback", prefix: "💬")

    /// Error Handling - ❌
    public static let errorHandling = IteoLoggerModule("Error Handling", prefix: "❌")

    /// In App Purchase - 💸
    public static let inAppPurchase = IteoLoggerModule("In App Purchase", prefix: "💸")

    /// Documents - 📄
    public static let documents = IteoLoggerModule("Documents", prefix: "📄")

    /// Network Connectivity - 🌐
    public static let networkConnectivity = IteoLoggerModule("Network Connectivity", prefix: "🌐")

    /// Accessibility - ♿️
    public static let accessibility = IteoLoggerModule("Accessibility", prefix: "♿️")

    /// User Onboarding - 🚀
    public static let userOnboarding = IteoLoggerModule("User Onboarding", prefix: "🚀")

    /// Debug Performance - ⏱️
    public static let debugPerformance = IteoLoggerModule("Debug Performance", prefix: "⏱️")

    /// Connectivity - 📡
    public static let connectivity = IteoLoggerModule("Connectivity", prefix: "📡")

    /// Social Media - 📱
    public static let socialMedia = IteoLoggerModule("Social Media", prefix: "📱")

    /// Calendar Events - 📅
    public static let calendarEvents = IteoLoggerModule("Calendar Events", prefix: "📅")

    /// Push Notification - 📬
    public static let pushNotification = IteoLoggerModule("Push Notification", prefix: "📬")

    /// Location - 📍
    public static let location = IteoLoggerModule("Location", prefix: "📍")

    /// QRC ode - 📷
    public static let qrCode = IteoLoggerModule("QR Code", prefix: "📷")

    /// Chat Messages - 💬
    public static let chatMessages = IteoLoggerModule("Chat Messages", prefix: "💬")

    /// Shopping Cart - 🛒
    public static let shoppingCart = IteoLoggerModule("Shopping Cart", prefix: "🛒")

    /// Emoji Reactions - 😄
    public static let emojiReactions = IteoLoggerModule("Emoji Reactions", prefix: "😄")

    /// Dark Mode - 🌙
    public static let darkMode = IteoLoggerModule("Dark Mode", prefix: "🌙")

    /// Chat Support - 🤖
    public static let chatSupport = IteoLoggerModule("Chat Support", prefix: "🤖")

    /// ARKit - 🌐
    public static let arKit = IteoLoggerModule("ARKit", prefix: "🌐")

    /// Facial Recognition - 👤
    public static let facialRecognition = IteoLoggerModule("Facial Recognition", prefix: "👤")

    /// App Rating - ⭐️
    public static let appRating = IteoLoggerModule("App Rating", prefix: "⭐️")

    /// Handwriting Recognition - ✍️
    public static let handwritingRecognition = IteoLoggerModule("Handwriting Recognition", prefix: "✍️")

    /// Augmented Audio - 🎧
    public static let augmentedAudio = IteoLoggerModule("Augmented Audio", prefix: "🎧")

    /// Code Scanner - 📟
    public static let codeScanner = IteoLoggerModule("Code Scanner", prefix: "📟")

    /// Feed - 📰
    public static let feed = IteoLoggerModule("Feed", prefix: "📰")

    /// Collaboration - 🤝
    public static let collaboration = IteoLoggerModule("Collaboration", prefix: "🤝")

    /// Password Manager - 🔒
    public static let passwordManager = IteoLoggerModule("Password Manager", prefix: "🔒")

    /// Sustainability - 🌱
    public static let sustainability = IteoLoggerModule("Sustainability", prefix: "🌱")

    /// Connection - 🪺
    public static let connection = IteoLoggerModule("Connection", prefix: "🪺")

    /// Intents - 🚿
    public static let intents = IteoLoggerModule("Intents", prefix: "🚿")

    /// "Share Extension - ♐️
    public static let shareExtension = IteoLoggerModule("Share Extension", prefix: "♐️")

    /// Device Token - 🎗️
    public static let deviceToken = IteoLoggerModule("Device Token", prefix: "🎗️")

    /// VideoConferencing - 🎥
    public static let videoConferencing = IteoLoggerModule("VideoConferencing", prefix: "🎥")

    /// Meeting - 🫱🏻‍🫲🏾
    public static let meeting = IteoLoggerModule("Meeting", prefix: "🫱🏻‍🫲🏾")

    /// Meeting - 📈
    public static let rpcRequest = IteoLoggerModule("RPC Request", prefix: "📈")

    /// Meeting - 📉
    public static let rpcResponse = IteoLoggerModule("RPC Response", prefix: "📉")

    /// AI - 🤖
    public static let ai = IteoLoggerModule("AI", prefix: "🤖")

    /// Machine Learning - 🧠
    public static let machineLearning = IteoLoggerModule("Machine Learning", prefix: "🧠")

    /// Data Science - 📊
    public static let dataScience = IteoLoggerModule("Data Science", prefix: "📊")

    /// Neural Network - 🔗
    public static let neuralNetwork = IteoLoggerModule("Neural Network", prefix: "🔗")

    /// Text Recognition - 🔡
    public static let textRecognition = IteoLoggerModule("Text Recognition", prefix: "🔡")

    /// Object Detection - 🎯
    public static let objectDetection = IteoLoggerModule("Object Detection", prefix: "🎯")

    /// Face Recognition - 😃
    public static let faceRecognition = IteoLoggerModule("Face Recognition", prefix: "😃")

    /// Sentiment Analysis - 💭
    public static let sentimentAnalysis = IteoLoggerModule("Sentiment Analysis", prefix: "💭")

    /// Chatbot - 💬
    public static let chatbot = IteoLoggerModule("Chatbot", prefix: "💬")

    /// Virtual Assistant - 🎙️
    public static let virtualAssistant = IteoLoggerModule("Virtual Assistant", prefix: "🎙️")

    /// OCR - 📄
    public static let ocr = IteoLoggerModule("OCR", prefix: "📄")

    /// Image Processing - 🖼
    public static let imageProcessing = IteoLoggerModule("Image Processing", prefix: "🖼")

    /// Video Processing - 🎥
    public static let videoProcessing = IteoLoggerModule("Video Processing", prefix: "🎥")

    /// Speech Recognition - 🗣️
    public static let speechRecognition = IteoLoggerModule("Speech Recognition", prefix: "🗣️")

    /// Sound Processing - 🎵
    public static let soundProcessing = IteoLoggerModule("Sound Processing", prefix: "🎵")

    /// Weather Data - ⛅️
    public static let weatherData = IteoLoggerModule("Weather Data", prefix: "⛅️")

    /// Smart Home - 🏡
    public static let smartHome = IteoLoggerModule("Smart Home", prefix: "🏡")

    /// Internet of Things - 🌍
    public static let iot = IteoLoggerModule("IoT", prefix: "🌍")

    /// Cybersecurity - 🔒
    public static let cybersecurity = IteoLoggerModule("Cybersecurity", prefix: "🔒")

    /// Firewall - 🔥
    public static let firewall = IteoLoggerModule("Firewall", prefix: "🔥")

    /// Malware Detection - 🦠
    public static let malwareDetection = IteoLoggerModule("Malware Detection", prefix: "🦠")

    /// Encryption - 🔐
    public static let encryption = IteoLoggerModule("Encryption", prefix: "🔐")

    /// Cryptography - 🕵️‍♂️
    public static let cryptography = IteoLoggerModule("Cryptography", prefix: "🕵️‍♂️")

    /// Cloud Storage - ☁️
    public static let cloudStorage = IteoLoggerModule("Cloud Storage", prefix: "☁️")

    /// Cloud Computing - 💻
    public static let cloudComputing = IteoLoggerModule("Cloud Computing", prefix: "💻")

    /// Server - 🖥
    public static let server = IteoLoggerModule("Server", prefix: "🖥")

    /// Database Migration - 🚛
    public static let databaseMigration = IteoLoggerModule("Database Migration", prefix: "🚛")

    /// Big Data - 📦
    public static let bigData = IteoLoggerModule("Big Data", prefix: "📦")

    /// Distributed Systems - 🖧
    public static let distributedSystems = IteoLoggerModule("Distributed Systems", prefix: "🖧")

    /// Load Balancing - ⚖️
    public static let loadBalancing = IteoLoggerModule("Load Balancing", prefix: "⚖️")

    /// API - 🔄
    public static let api = IteoLoggerModule("API", prefix: "🔄")

    /// REST API - 🌐
    public static let restApi = IteoLoggerModule("REST API", prefix: "🌐")

    /// GraphQL - 📈
    public static let graphql = IteoLoggerModule("GraphQL", prefix: "📈")

    /// SDK - 📦
    public static let sdk = IteoLoggerModule("SDK", prefix: "📦")

    /// Backend - 🔧
    public static let backend = IteoLoggerModule("Backend", prefix: "🔧")

    /// Frontend - 🎨
    public static let frontend = IteoLoggerModule("Frontend", prefix: "🎨")

    /// Web Development - 🌍
    public static let webDevelopment = IteoLoggerModule("Web Development", prefix: "🌍")

    /// Mobile Development - 📱
    public static let mobileDevelopment = IteoLoggerModule("Mobile Development", prefix: "📱")

    /// UI Components - 🏗
    public static let uiComponents = IteoLoggerModule("UI Components", prefix: "🏗")

    /// UX Design - 🎨
    public static let uxDesign = IteoLoggerModule("UX Design", prefix: "🎨")

    /// Prototyping - 📝
    public static let prototyping = IteoLoggerModule("Prototyping", prefix: "📝")

    /// Design System - 🏗
    public static let designSystem = IteoLoggerModule("Design System", prefix: "🏗")

    /// Typography - 🔤
    public static let typography = IteoLoggerModule("Typography", prefix: "🔤")

    /// Theming - 🎭
    public static let theming = IteoLoggerModule("Theming", prefix: "🎭")

    /// Animation - 🎞️
    public static let animation = IteoLoggerModule("Animation", prefix: "🎞️")

    /// Performance Optimization - 🚀
    public static let performanceOptimization = IteoLoggerModule("Performance Optimization", prefix: "🚀")

    /// Code Review - 👀
    public static let codeReview = IteoLoggerModule("Code Review", prefix: "👀")

    /// Unit Testing - 🧪
    public static let unitTesting = IteoLoggerModule("Unit Testing", prefix: "🧪")

    /// Integration Testing - 🔄
    public static let integrationTesting = IteoLoggerModule("Integration Testing", prefix: "🔄")

    /// UI Testing - 🎭
    public static let uiTesting = IteoLoggerModule("UI Testing", prefix: "🎭")

    /// Bug Tracking - 🐛
    public static let bugTracking = IteoLoggerModule("Bug Tracking", prefix: "🐛")

    /// Version Control - 🗂
    public static let versionControl = IteoLoggerModule("Version Control", prefix: "🗂")

    /// CI/CD - 🔄
    public static let ciCd = IteoLoggerModule("CI/CD", prefix: "🔄")

    /// Build Pipeline - 🏗
    public static let buildPipeline = IteoLoggerModule("Build Pipeline", prefix: "🏗")

    /// Package Management - 📦
    public static let packageManagement = IteoLoggerModule("Package Management", prefix: "📦")

    /// Dependency Injection - 🏗
    public static let dependencyInjection = IteoLoggerModule("Dependency Injection", prefix: "🏗")

    /// Authentication - 🔑
    public static let authentication = IteoLoggerModule("Authentication", prefix: "🔑")

    /// Authorization - 🔓
    public static let authorization = IteoLoggerModule("Authorization", prefix: "🔓")

    /// Two-Factor Authentication - 📲
    public static let twoFactorAuthentication = IteoLoggerModule("Two-Factor Authentication", prefix: "📲")

    /// Data Validation - ✅
    public static let dataValidation = IteoLoggerModule("Data Validation", prefix: "✅")

    /// Logging - 📝
    public static let logging = IteoLoggerModule("Logging", prefix: "📝")

    /// Debugging - 🛠️
    public static let debugging = IteoLoggerModule("Debugging", prefix: "🛠️")

    /// Profiling - 📊
    public static let profiling = IteoLoggerModule("Profiling", prefix: "📊")

    /// Exception Handling - 🚨
    public static let exceptionHandling = IteoLoggerModule("Exception Handling", prefix: "🚨")

    /// Event Handling - 🎟
    public static let eventHandling = IteoLoggerModule("Event Handling", prefix: "🎟")

    /// Push Notifications - 📬
    public static let pushNotifications = IteoLoggerModule("Push Notifications", prefix: "📬")

    /// VDS - 🎨
    public static let vds = IteoLoggerModule("VDS", prefix: "🎨")

    /// Bucket - 🪣
    public static let bucket = IteoLoggerModule("Bucket", prefix: "🪣")

    /// LOG - 🖊
    public static let unknown = IteoLoggerModule("LOG", prefix: "🖊")

    public let prefix: String
    public let name: String
}
