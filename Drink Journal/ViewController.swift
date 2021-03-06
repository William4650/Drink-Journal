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
    
    let stringFromDateFormatter = DateFormatter()
    
    
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
        
        stringFromDateFormatter.dateFormat = "YYYY-MM-dd"

        
        // If there's a Date object stored to the device then delete it before doing anything else.
        if (UserDefaults.standard.object(forKey: "saveDate") as? Date) != nil {
            UserDefaults.standard.removeObject(forKey: "saveDate")
        }
        
        
        let savedCupsDrank = UserDefaults.standard.integer(forKey: "cupsDrank")
        let previousSaveDate = UserDefaults.standard.string(forKey: "saveDate") ?? "2002-01-10"
        
        //print(cupsDrank, previousSaveDate)
        
        self.cupsDrank = savedCupsDrank
        amount.text = String(cupsDrank)
        
        resetDefaults()
        
        self.cupsDrank = savedCupsDrank
        amount.text = String(cupsDrank)
        
        NotificationCenter.default.addObserver(self, selector: #selector(viewDidEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
    }
    

    @objc func viewDidEnterForeground () {
        print("View Entered Foreground")
        
        currentDay = Date()
        
        resetDefaults()
        
        let savedCupsDrank = UserDefaults.standard.integer(forKey: "cupsDrank")
        let previousSaveDate = UserDefaults.standard.string(forKey: "saveDate") ?? "2002-01-10"
        
        self.cupsDrank = savedCupsDrank
        amount.text = String(cupsDrank)
    }
    
    
    func updateAmount() {
        let currentDayFormatted = stringFromDateFormatter.string(from: currentDay)
        
        amount.text = String(describing: cupsDrank)
        UserDefaults.standard.set(cupsDrank, forKey: "cupsDrank")
        UserDefaults.standard.set(currentDayFormatted, forKey: "saveDate")
//        print("SAVED \(currentDayFormatted)")
    }

    func resetDefaults() {
        
        let currentDayFormatted = stringFromDateFormatter.string(from: currentDay)
        
        let previousSaveDate = UserDefaults.standard.string(forKey: "saveDate") ?? "2002-01-10"
       //print("CUR: \(currentDayFormatted)")
       // print("PREV: \(previousSaveDate)")
        
        if currentDayFormatted != previousSaveDate {
//            print("Resetting")
            UserDefaults.standard.set(0, forKey: "cupsDrank")
            UserDefaults.standard.set(currentDayFormatted, forKey: "saveDate")
        }
        
    }
    

}

