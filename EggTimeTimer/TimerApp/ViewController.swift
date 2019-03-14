//
//  ViewController.swift
//  TimerApp
//
//  Created by Yury Popov on 13/03/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var time = 0
    var bonAppetit = "Bon appetit"
    
   
    @IBOutlet weak var timerLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func play(_ sender: Any) {
        if timerLabel.text == bonAppetit {
            time = 0
            timerLabel.text = String(time)
            
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        time = 0
        timerLabel.text = String(time)
        
    }
    
    @IBAction func minusTen(_ sender: Any) {
        time -= 10
        timerLabel.text = String(time)
    }
    
    @IBAction func plusTen(_ sender: Any) {
        time += 10
        timerLabel.text = String(time)
    }
    
    
    @IBAction func softEgg(_ sender: Any) {
        timer.invalidate()
        time = -120
        timerLabel.text = String(time)
       
        
    }
    @IBAction func mediumEgg(_ sender: Any) {
        timer.invalidate()
        time = -240
        timerLabel.text = String(time)
    }
    @IBAction func hardEgg(_ sender: Any) {
        timer.invalidate()
        time = -420
        timerLabel.text = String(time)
    }
    
    
    
    @objc func decreaseTimer() {
        
        switch time {
        case 0..<Int.max:
            time += 1
            timerLabel.text = String(time)
        case -1:
            timer.invalidate()
            timerLabel.text = bonAppetit
        case -420...0:
            time += 1
            timerLabel.text = String(time)
            
        default:
            timer.invalidate()
        }
        
//        func decreaseTimerEgg() {
//            switch time {
//            case -420..<0:
//                time += 1
//                timerLabel.text = String(time)
//
//            default:
//                timer.invalidate()
//            }
//        }
        
//        if time < 0 {
//
//            time += 1
//            timerLabel.text = String(time)
//
//        } else if time > 0 {
//
//            time += 1
//            timerLabel.text = String(time)
//
//        } else {
//            timer.invalidate()
//        }
        
    }
 
 
        
    
}

