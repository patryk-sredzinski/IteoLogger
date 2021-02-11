//
//  LogButton.swift
//  IteoLoggerExample
//
//  Created by Patryk Średziński on 04/02/2021.
//

import SwiftUI

struct LogButton: View {
    let title: String
    let action: () -> Void
    var body: some View {
        
        Button(action: action) {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.caption)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(8)
            .foregroundColor(.white)
            .background(Color(red: 1.0, green: 0.4, blue: 0))
            .cornerRadius(8)
        }
    }
}

struct LogButton_Previews: PreviewProvider {
    static var previews: some View {
        LogButton(title: "Test", action: { })
    }
}
