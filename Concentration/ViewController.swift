//
//  ViewController.swift
//  Concentration
//
//  Created by Yohan Lee on 8/18/19.
//  Copyright © 2019 Yohan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = GameModel(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["♔", "♕", "♖", "♘", "♗", "♙"]
    var emoji = [Int : String]()

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber is \(String(describing: cardNumber))")
            game.chooseCard(at: cardNumber)
            updateView()
        } else {
            print("card does not exist")
        }
    }
    
    func updateView() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.getCard(at: index)
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "???"
    }
}

