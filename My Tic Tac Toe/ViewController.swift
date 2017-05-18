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
    
    @IBAction func action(_ sender: AnyObject)   // display x or o
    {
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
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

