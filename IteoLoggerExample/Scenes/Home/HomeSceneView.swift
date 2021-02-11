//
//  HomeSceneView.swift
//  IteoLoggerExample
//
//  Created by Patryk Średziński on 04/02/2021.
//

import IteoLogger
import SwiftUI

struct HomeSceneView: View {
    
    @EnvironmentObject var contentViewModel: HomeSceneViewModel
    
    var body: some View {
        VStack {
            Text("Iteo Logger")
            Text("Sample logging buttons")
            ScrollView {
                ForEach(SampleLog.allCases) { log in
                    LogButton(title: log.rawValue.camelCaseToWords().capitalizingFirstLetter()) { contentViewModel.logSample(log) }
                }
            }
            Spacer()
            LogButton(title: "Show Logs") {
                contentViewModel.logger.displayLogs()
                contentViewModel.logger.log(.screenView, .info, "IteoLogger loaded")
            }.padding(.top, 32)
        }
        .padding()
        .onAppear(perform: {
            contentViewModel.logger.log(.screenView, .info, "HomeSceneView loaded")
        })
    }
    
}

struct HomeSceneView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSceneView()
    }
}

private extension String {

    func camelCaseToWords() -> String {
        return unicodeScalars.reduce("") {
            if CharacterSet.uppercaseLetters.contains($1) {
                if $0.count > 0 {
                    return ($0 + " " + String($1))
                }
            }
            return $0 + String($1)
        }
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
}
