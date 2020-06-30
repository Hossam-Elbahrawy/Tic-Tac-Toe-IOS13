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
    @IBOutlet weak var playerNamesView: UIStackView!
    @IBOutlet weak var winnerView: UIStackView!
    @IBOutlet weak var winnerName: UILabel!
    
    var currentPlayer = 1
    var boardCells: [(UIButton?)] = []
    var board = [
        0,0,0,
        0,0,0,
        0,0,0
    ]
    let winPatterns = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
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
        winnerView.isHidden = true
    }
    
    @IBAction func cellPressed(_ sender: UIButton) {
        let cellNumber = Int(sender.currentTitle!)!
        if board[cellNumber] == 0 {
            play(player: currentPlayer, cell: cellNumber )
        }
    }
    
    @IBAction func resetGamePressed(_ sender: UIButton) {
        print("Resseting Game")
        clearBoard()
        playerNamesView.isHidden = false
        winnerView.isHidden = true
    }
    
    func clearBoard (){
        board = [
            0,0,0,
            0,0,0,
            0,0,0
        ]
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
        let winner: Int? = checkWinner()
        if (winner == nil ){
            currentPlayer = changePlayer(player)
        }else{
            endGame()
        }
    }
    
    func changePlayer(_ player: Int)-> Int{
        if player == 1 {
            return 2
            
        }else {
            return 1
        }
    }
    
    func checkWinner()-> Int? {
        for pattern in winPatterns{
            var cnt = 0
            for cell in pattern{
                if(board[cell] == currentPlayer){
                    cnt += 1
                }
            }
            if(cnt == 3){
                return currentPlayer
            }
            cnt = 0
        }
        return nil
    }
    
    func endGame(){
        board = [
            3,3,3,
            3,3,3,
            3,3,3
        ]
        if(currentPlayer == 1 ){
            winnerName.textColor = UIColor.init(red: 245/255, green: 239/255, blue: 211/255, alpha: 1.0)
            winnerName.text = "PLAYER 1"
        }else{
            winnerName.text = "PLAYER 2"
            winnerName.textColor = UIColor.init(named: "Black")
        }
        playerNamesView.isHidden = true
        winnerView.isHidden = false
    }
}

