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
    @IBOutlet weak var player1Name: UILabel!
    @IBOutlet weak var player2Name: UILabel!
    
    var currentPlayer = 1
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
        
        clearBoard()
        print("Done initializing...")
        
    }
    
    @IBAction func cellPressed(_ sender: UIButton) {
        print(sender.currentTitle!)
        //        print(sender.currentBackgroundImage!.accessibilityIdentifier!)
        let cellNumber = Int(sender.currentTitle!)!
        if board[cellNumber] == 0 {
            play(player: currentPlayer, cell: cellNumber )
        }
        let winner = checkWinner()
        print(" The Winner is \(winner)")
    }
    
    @IBAction func resetGamePressed(_ sender: UIButton) {
        print("Resseting Game")
        clearBoard()
    }
    
    func clearBoard (){
        player1Name.font = UIFont.init(name: "TradeWinds", size: 21)
        for cell in boardCells{
            cell!.setBackgroundImage(UIImage.init(named: "emptyCell"), for: .normal)
        }
    }
    
    func play (player:Int, cell:Int){
        
        board[cell] = player
        
        if(player == 1){
            boardCells[cell]?.setBackgroundImage(UIImage.init(named: "oCell"), for: .normal)
            player1Name.font = UIFont.init(name: "TradeWinds", size: 17)
            player2Name.font = UIFont.init(name: "TradeWinds", size: 21)
            
        }else{
            boardCells[cell]?.setBackgroundImage(UIImage.init(named: "xCell"), for: .normal)
            player2Name.font = UIFont.init(name: "TradeWinds", size: 17)
            player1Name.font = UIFont.init(name: "TradeWinds", size: 21)
            
        }
        currentPlayer = changePlayer(player)
        
    }
    
    func changePlayer(_ player: Int)-> Int{
        if player == 1 {
            return 2
            
        }else {
            return 1
        }
    }
    
    func checkWinner()-> String{
        return "DADA"
    }
}

