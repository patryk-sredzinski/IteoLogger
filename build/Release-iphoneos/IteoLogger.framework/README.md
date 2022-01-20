![IteoLogger: Elegant Logger in Swift](https://raw.githubusercontent.com/psredzinski/IteoLogger/master/Preview/iteo_logo.png)

IteoLogger is a smart logger created in Swift, with a nice interface.

Documentation can be found here:
https://htmlpreview.github.io/?https://github.com/psredzinski/IteoLogger/blob/master/docs/index.html

- [Features](#features)
- [Preview](#preview)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Credits](#credits)
- [License](#license)

## Features

- [x] Logging with 4 basic levels: *info, *success, *warning, *error
- [x] Groupping logs with modules (with a name and an emoji prefix)
- [x] Option to create your own modules in your app
- [x] An option to toggle possibility to log to xcode console with your own format
- [x] An option to log to your device storage
- [x] Logs scene that displays all stored logs
- [x] Filtering logs on Logs scene
- [x] Hold press on a log item to copy it to the clipboard

## Preview
Logs Scene             |  Filters Scene
:-------------------------:|:-------------------------:
![](https://raw.githubusercontent.com/psredzinski/IteoLogger/master/Preview/log_scene.png)  |  ![](https://raw.githubusercontent.com/psredzinski/IteoLogger/master/Preview/filters_scene.png)

## Requirements

- iOS 11.0+
- Xcode 11+
- Swift 5.1+

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate IteoLogger into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'IteoLogger', :git => 'https://github.com/psredzinski/IteoLogger.git'
```
### Swift Package Manager

 [SPM](https://swift.org/package-manager/) is Apple's decentralized dependency manager to integrate libraries to your Swift projects.

 In order to install IteoLogger with SPM go to `File` -> `Swift Packages` -> `Add Package Dependency...` -> Select your Project -> enter [This](https://github.com/psredzinski/IteoLogger) URL -> On Rules screen leave `Version` checkbox -> Pick targets you want to add package to -> Hit Finish and you are done.
 
## Usage

Create *IteoLogger instance with consumers:

```swift
let logger = IteoLogger(consumers: [
    IteoLoggerConsoleItemConsumer(),
    IteoLoggerStorageItemConsumer(logsDirectoryName: "your_logs_directory")
])
```

Create a custom button / hidden gesture somewhere in your app, and call:

```swift
logger.displayLogs(logsDirectoryName: "your_logs_directory")
```

to display Logs scene.

## Credits

IteoLogger is owned and maintained by the [iteo](http://iteo.com). You can follow them on Facebook at [https://www.facebook.com/iteo.apps](https://www.facebook.com/iteo.apps).

## License

IteoLogger is released under the MIT license.
