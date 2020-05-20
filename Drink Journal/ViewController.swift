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
    var savedCups: Int?
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
        
        let savedCupsDrank = UserDefaults.standard.integer(forKey: "cupsDrank")
        let previousSaveDate = UserDefaults.standard.object(forKey: "saveDate") as! Date
        print(cupsDrank, previousSaveDate)
        
        self.cupsDrank = savedCupsDrank
        amount.text = String(cupsDrank)
        
    }
    
    func updateAmount() {
        amount.text = String(describing: cupsDrank)
        UserDefaults.standard.set(cupsDrank, forKey: "cupsDrank")
        UserDefaults.standard.set(Date(), forKey: "saveDate")
    }


}

