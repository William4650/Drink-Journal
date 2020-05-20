//
//  ViewController.swift
//  Drink Journal
//
//  Created by William Phenicie on 5/20/20.
//  Copyright © 2020 Peer Group Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cupsDrank: Int = 0
    var currentDay: Date = Date()
    var savedDay: Date?
    
    @IBAction func minus(_ sender: Any) {
        
        cupsDrank -= 1
        updateAmount()
        
    }
    
    @IBAction func plus(_ sender: Any) {
        
        cupsDrank += 1
        updateAmount()
        
    }
    
    @IBOutlet weak var amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func updateAmount() {
        amount.text = String(describing: cupsDrank)
    }


}

