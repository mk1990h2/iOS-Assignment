//
//  ViewController.swift
//  ApplePie
//
//  Created by 佐藤美佳 on 2020/04/22.
//  Copyright © 2020 Mika Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["pikachu", "bulbasaur", "charmander", "squirtle",
                       "caterpie", "metapod", "butterfree", "squirtle",
                       "weedle", "kakuna", "beedrill", "pidgey"
    ]
    let incorrectMovesAllowed = 7
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currenctGame: Game!

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currenctGame.playerGuessed(letter: letter)
        updateGameState()
    }

    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currenctGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currenctGame.formattedWord {
            letters.append(String(letter))
        }
        correctWordLabel.text = letters.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currenctGame.incorrectMovesRemaining)")
    }
    
    func updateGameState() {
        if currenctGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currenctGame.word == currenctGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
    }

}

