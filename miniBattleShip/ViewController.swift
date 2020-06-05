//
//  ViewController.swift
//  miniBattleShip
//
//  Created by Sebastian Matyszewski on 05/06/2020.
//  Copyright © 2020 Sebastian Matyszewski. All rights reserved.
//

import UIKit
var a = 0
class ViewController: UIViewController {
    @IBOutlet weak var buttonPutShips: UIButton!
    
    @IBOutlet weak var textPutShips: UITextView!
    @IBOutlet weak var boardEnemy: UIImageView!
    @IBOutlet weak var boardOwn: UIImageView!
    var status = 0
    var ships = 0
    var ownBoard = [0,0,0,0,0,0,0,0,0,0]
    var enemyBoard = [0,0,0,0,0,0,0,0,0,0]
    
    func losuj(n:Int,max:Int){
        
        var wylosowane = [Int]()
        while wylosowane.count<n{
            var liczba:Int?
            repeat{ liczba = Int(arc4random()) % max + 1
                
            }while wylosowane.contains(liczba!)
            wylosowane.append(liczba!)
        }
        for liczba in wylosowane{
            //print (liczba)
            enemyBoard[liczba] = 1;
        }
    }
    
    @IBAction func buttonPutShips(_ sender: Any) {
        status = 1
        losuj(n:3, max:9)
        buttonPutShips.isHidden = true
        textPutShips.isHidden = true
        boardEnemy.isHidden = false
        
        for n in 10...19{
            let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
            tempButton?.isHidden = false
        }
        
        for n in 1...9{
            if ownBoard[n] == 1{
                let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                tempButton?.isEnabled = false
            }
            
        }
        //wypisanie wartości tablic
        for n in 1...9{
            print(ownBoard[n])
        }
        print(" ")
        for n in 1...9{
            print(enemyBoard[n])
        }
        
        
    }
    
    @IBAction func battle(_ sender: AnyObject) {
        //let ship = Int.random(in: 1 ... 9)
        
        if status == 0{
            
                a = sender.tag
                if ownBoard[a] == 1{
                    let tempButton = self.view.viewWithTag(Int(a)) as? UIButton
                    tempButton?.backgroundColor = UIColor.white.withAlphaComponent(1)
                    ownBoard[a] = 0
                    ships = ships - 1
                    
                    for n in 1...9{
                        if ownBoard[n] == 0{
                            let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                            tempButton?.isEnabled = true
                        }
                        
                    }
                    buttonPutShips.isEnabled = false
                    
                }else{
                    ownBoard[a] = 1
                    let tempButton = self.view.viewWithTag(Int(a)) as? UIButton
                    tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
                    ships = ships + 1
                    
                    if ships == 3{
                        for n in 1...9{
                            if ownBoard[n] == 0{
                                let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                                tempButton?.isEnabled = false
                            }
                            
                        }
                        buttonPutShips.isEnabled = true
                    }
                }
                
            
        }else if status == 1{
            a = sender.tag
            print(a)
        }
        
        //let number = Int(arc4random_uniform(9))
       // let tempButton = self.view.viewWithTag(Int(number)) as? UIButton
       // tempButton?.backgroundColor = UIColor.blue.withAlphaComponent(0.6)
        //tempButton?.isHidden = true
        //a = sender.tag
       // print(a)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardEnemy.isHidden = true
        if status == 0{
            for n in 10...19{
                let tempButton = self.view.viewWithTag(Int(n)) as? UIButton
                tempButton?.isHidden = true
            }
        }
        buttonPutShips.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

