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
    
    let dateFromStringFormatter = DateFormatter()
    
    
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
        
        // If there's a Date object stored to the device then delete it before doing anything else.
        if (UserDefaults.standard.object(forKey: "saveDate") as? Date) != nil {
            UserDefaults.standard.removeObject(forKey: "saveDate")
        }
        
        
        let savedCupsDrank = UserDefaults.standard.integer(forKey: "cupsDrank")
        let previousSaveDate = UserDefaults.standard.string(forKey: "saveDate") ?? "2002-01-10"
        
       // print(cupsDrank, previousSaveDate)
        
        self.cupsDrank = savedCupsDrank
        amount.text = String(cupsDrank)
        
        resetDefaults()
        
    }
    
    func updateAmount() {
        dateFromStringFormatter.dateFormat = "YYYY-MM-dd"
        let currentDayFormatted = dateFromStringFormatter.string(from: currentDay)
        
        amount.text = String(describing: cupsDrank)
        UserDefaults.standard.set(cupsDrank, forKey: "cupsDrank")
        UserDefaults.standard.set(currentDayFormatted, forKey: "saveDate")
    }

    func resetDefaults() {
        
        let currentDayFormatted = dateFromStringFormatter.string(from: currentDay)
        
        let previousSaveDate = UserDefaults.standard.string(forKey: "saveDate") ?? "2002-01-10"
        print(currentDayFormatted, previousSaveDate)
        
        if currentDayFormatted != previousSaveDate {
            UserDefaults.standard.set(0, forKey: "cupsDrank")
            UserDefaults.standard.set(currentDayFormatted, forKey: "saveDate")
        }
        
    }
    

}

