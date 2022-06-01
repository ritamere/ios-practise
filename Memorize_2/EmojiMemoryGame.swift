//
//  EmojiMemoryGame.swift
//  Memorize_2
//
//  Created by Rita Merezhko on 31.10.2021.
//  ViewModel

//all user intents are recorded in the ViewModel

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🛵", "🤖", "🚒", "🚡", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚐", "🛻", "🚚", "🚛",  "🚲", "🏍", "🛺", "🚔", "🚍",  "🚘", "🚖", "🚃", "🚟"]

    private static func createMemoryGame() -> MemoryGame<String>  {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()

    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }


    //MARK: - Intents

    func choose (_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}



struct Previews_EmojiMemoryGame_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
