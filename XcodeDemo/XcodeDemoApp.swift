//
//  XcodeDemoApp.swift
//  XcodeDemo
//
//  Created by Farzaad Goiporia on 2023-10-23.
//

import SwiftUI
import SwiftData

@main
struct XcodeDemoApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Score.self])
    }
}
