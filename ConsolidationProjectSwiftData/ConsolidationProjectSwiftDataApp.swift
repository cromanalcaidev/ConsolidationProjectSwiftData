//
//  ConsolidationProjectSwiftDataApp.swift
//  ConsolidationProjectSwiftData
//
//  Created by Carlos Román Alcaide on 2/5/24.
//

import SwiftData
import SwiftUI

@main
struct ConsolidationProjectSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
