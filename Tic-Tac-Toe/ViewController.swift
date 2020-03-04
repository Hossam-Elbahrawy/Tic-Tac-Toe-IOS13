//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Hossam Elbahrawy on 3/2/20.
//  Copyright © 2020 Hossam Elbahrawy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cell0: UIButton!
    @IBOutlet weak var cell1: UIButton!
    @IBOutlet weak var cell2: UIButton!
    @IBOutlet weak var cell3: UIButton!
    @IBOutlet weak var cell4: UIButton!
    @IBOutlet weak var cell5: UIButton!
    @IBOutlet weak var cell6: UIButton!
    @IBOutlet weak var cell7: UIButton!
    @IBOutlet weak var cell8: UIButton!
    
    var player = 0
    var boardCells: [(UIButton?)] = []
    var board = [
        0,0,0,
        0,0,0,
        0,0,0
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
         boardCells = [
            cell0,
            cell1,
            cell2,
            cell3,
            cell4,
            cell5,
            cell6,
            cell7,
            cell8,
            ]
        
    drawBoard()
        print("Done initializing...")

    }
    func drawBoard (){
        for cell in boardCells{
            cell!.setBackgroundImage(UIImage.init(named: "emptyCell"), for: .normal)
        }
    }
    func play (player:Int){
        
    }
    @IBAction func cellPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
//        print(sender.currentBackgroundImage!.accessibilityIdentifier!)
    }
    
    @IBAction func resetGamePressed(_ sender: UIButton) {
        print("Resseting Game")
    }
    
}

