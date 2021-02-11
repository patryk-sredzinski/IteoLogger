//
//  IteoLoggerExampleApp.swift
//  IteoLoggerExample
//
//  Created by Patryk Średziński on 04/02/2021.
//

import SwiftUI

@main
struct IteoLoggerExampleApp: App {
    var body: some Scene {
        WindowGroup {
            HomeSceneView().environmentObject(HomeSceneViewModel())
        }
    }
}
