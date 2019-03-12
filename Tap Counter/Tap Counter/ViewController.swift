//
//  ViewController.swift
//  Tap Counter
//
//  Created by Yury Popov on 12/03/2019.
//  Copyright © 2019 Yury Popov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        count += 1
        countLabel.text = String(count)
       
        
    }
    @IBAction func resetCounter(_ sender: UIButton) {
        countLabel.text = "0"
        count = 0
        countLabel.font = countLabel.font.withSize(200)
    }
    @IBAction func addTeenTap(_ sender: UIButton) {
        count += 10
        countLabel.text = String(count)
        //add
    }
    
}

