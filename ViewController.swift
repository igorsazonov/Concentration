//
//  ViewController.swift
//  Concentration_Igor
//
//  Created by Игорь Сазонов on 19/04/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentration(numberOfPairsOfCards: (cardMass.count + 1) / 2)
    
    var flipcount = 0 {
        didSet{
            FlipCount.text = "Flips: \(flipcount)"
        }
    }
    
    @IBOutlet weak var FlipCount: UILabel!
    
    @IBOutlet var cardMass: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipcount += 1
        if let cardNumber = cardMass.lastIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choosen card was not in cardButtons")
        }
    }
    
    func updateViewFromModel() {
        for index in cardMass.indices {
            let button = cardMass[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🐶","🙈","🥶","😈","🤮","👻","✌🏾","🤖","🎃"]
    
    var emoji = Dictionary<Int, String>()
    
    func emoji (for card: Card) -> String {
        if emoji[card.identifier] ==  nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
    @IBAction func TabButtonNewGame() {
        flipcount = 0
        game.resetGame()
        updateViewFromModel()
    }
}


