//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Luke Dinh on 8/19/16.
//  Copyright © 2016 Blue Lamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet var replayButton: UIButton!
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBAction func replay(_ sender: AnyObject) {
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        gameOverLabel.isHidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        replayButton.isHidden = true
        replayButton.center = CGPoint(x: replayButton.center.x - 500, y: replayButton.center.y)
        var buttonToClear : UIButton
        for i in 0..<9 {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, for: UIControlState())
        }
    }
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameIsActive) {
            gameState[sender.tag] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: UIControlState())
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: UIControlState())
                activePlayer = 1
            }
            for winningCombination in winningCombinations {
                if (gameState[winningCombination[0]] != 0 && gameState[winningCombination[0]] == gameState[winningCombination[1]] && gameState[winningCombination[1]] == gameState[winningCombination[2]]) {
                    gameIsActive = false
                    if gameState[winningCombination[0]] == 1 {
                        gameOverLabel.text = "Noughts have won!"
                    } else {
                        gameOverLabel.text = "Crosses have won!"
                    }
                    gameOver()
                }
            }
            
            if gameIsActive {
                gameIsActive = false
                for index in gameState {
                    if index == 0 {
                        gameIsActive = true
                    }
                }
                if gameIsActive == false {
                    gameOverLabel.text = "Draw!"
                    gameOver()
                }
            }
            
        }
        
    }
    
    func gameOver() {
        self.gameOverLabel.isHidden = false
        self.replayButton.isHidden = false
        UIView.animate(withDuration: 0.7, animations: {
            self.gameOverLabel.center = CGPoint(x: self.gameOverLabel.center.x + 500, y: self.gameOverLabel.center.y)
            self.replayButton.center = CGPoint(x: self.replayButton.center.x + 500, y: self.replayButton.center.y)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameOverLabel.isHidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 500, y: gameOverLabel.center.y)
        replayButton.isHidden = true
        replayButton.center = CGPoint(x: replayButton.center.x - 500, y: replayButton.center.y)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

