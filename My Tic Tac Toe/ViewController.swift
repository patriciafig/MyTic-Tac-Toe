//
//  ViewController.swift
//  My Tic Tac Toe
//
//  Created by Patricia on 5/18/17.
//  Copyright © 2017 Patricia Figueroa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 1. Create a variable that keeps track of whose turn it is
    
    var ActivePlayer = 1  // x
    var GameStatus = [0,0,0,0,0,0,0,0,0]   // each represent a place in the board
    
    let  WinCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]      // defines how to classify a winner based on tag position of x or o
    
    var ActiveGame = true
    
    
    @IBOutlet weak var label: UILabel!     // has won message 
    
    
    @IBAction func action(_ sender: AnyObject)   // display x or o
    {
        // check game status according to the sender tag
        
        if (GameStatus[sender.tag-1] == 0)
        {
            GameStatus[sender.tag-1] = ActivePlayer     // can't override any game piece 
            
               // can only place x or o at one time
            if (ActivePlayer == 1 )
            {
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                ActivePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())    // allows you to switch from x or o
                ActivePlayer = 1
            }
        }
        
          // loops through all the winning combinations
        for combinations in WinCombinations
        {
            if GameStatus[combinations[0]] != 0 && GameStatus[combinations[0]] == GameStatus[combinations[1]] && GameStatus[combinations[1]] == GameStatus[combinations[2]]
            {
            
                ActiveGame = false     // pause game if winner 
                if GameStatus[combinations[0]] == 1
                {
                 //  x has won
                    label.text = "X HAS WON!"   // DISPLAYS ON LABEL
                
                }
                else
                {
                
                // o has won
                    label.text = "O HAS WON"    // DISPLAYS ON LABEL
                }
                
                playAgainButton.isHidden = false;
                label.isHidden = false
            }
       }
        
        
        ActiveGame = false
        
        
        for i in GameStatus
        {
        if i == 0
            {
                ActiveGame  = true
                break
            }
        }
        
        if ActiveGame == false
        {
        label.text = "IT'S A DRAW"
        label.isHidden = false 
        playAgainButton.isHidden = false
            
        }
        
    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!    // outlet
    
    @IBAction func playAgain(_ sender: AnyObject)    // button
    {
    // enable user to restart game
        
        GameStatus = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        ActiveGame = true
        ActivePlayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            
        let button = view.viewWithTag(i) as! UIButton
        button.setImage(nil, for: UIControlState())
            
        }
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

