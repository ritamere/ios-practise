//
//  Memory Game.swift
//  Memorize_2
//
//  Created by Rita Merezhko on 27.10.2021.
//  Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard : Int?
    
    mutating func choose(_ card: Card) {
//          if let chosenIndex =  index(of: card) {
        // here we're looking through our cards to find the first index where that card's id equals our card's id:
        if let chosenIndex =  cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex  = indexOfTheOneAndOnlyFaceUpCard {
                if  cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard  = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print ("\(cards)")
    }
    
    /*    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil // bogus!
    }                                           */
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content: CardContent = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool =  false
        var isMatched: Bool = false
        let content: CardContent
        let id: Int
        
    }
}
