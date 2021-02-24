//
//  Insta402App.swift
//  Insta402
//
//  Created by Will Taylor on 2/23/21.
//

import SwiftUI

@main
struct Insta402App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationViewStyle(StackNavigationViewStyle())
                    .navigationTitle("Insta402")
            }
        }
    }
}
