//
//  GameModel.swift
//  Concentration
//
//  Created by Yohan Lee on 10/12/19.
//  Copyright © 2019 Yohan Lee. All rights reserved.
//

import Foundation

class GameModel
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUp: Int?

    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            let matchingCard = card     // make a copy
            cards.append(card)          // could have used cards.append(card) twice
            cards.append(matchingCard)  // or cards += { card, card }
        }
        shuffle()
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUp, matchIndex != index { //one card is face up
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUp = nil
            } else { // either no cards or two cards are face up
                for anyIndex in cards.indices {
                    cards[anyIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUp = index
            }
        }
    }
    
    func getCard(at index: Int) -> Card {
        return cards[index]
    }

}
