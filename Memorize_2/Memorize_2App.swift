//
//  Memorize_2App.swift
//  Memorize_2
//
//  Created by Rita Merezhko on 23.09.2021.
//

import SwiftUI

@main
struct Memorize_2App: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
