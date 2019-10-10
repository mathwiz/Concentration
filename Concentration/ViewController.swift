//
//  ViewController.swift
//  Concentration
//
//  Created by Yohan Lee on 8/18/19.
//  Copyright © 2019 Yohan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["♔", "♕", "♖", "♘", "♗", "♙", "♔", "♕", "♖", "♘", "♗", "♙"]

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("cardNumber is \(String(describing: cardNumber))")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }

    func flipCard(withEmoji emoji: String, on button: UIButton) {
        print("flipCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
        }
    }
}

