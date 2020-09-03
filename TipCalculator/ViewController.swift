//
//  ViewController.swift
//  TipCalculator
//
//  Created by Tom Riddle on 8/27/20.
//  Copyright © 2020 Tom Riddle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  let TIME_DATA = 10 * 60.0//data is stored in 10 mins
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    //Toggle keyboard for billField when the app is launched
    self.billField.becomeFirstResponder()
    print("view DidLoad")
    //if app restart, load the data from previous calculation
    loadData()
  }

  func loadData() {
    let defaults = UserDefaults.init()
    let savedStartTime = defaults.double(forKey: "start_time")
    let timePassed = NSDate().timeIntervalSince1970 - savedStartTime
    //if over time, do not load data
    if timePassed > TIME_DATA {
      return
    }
    //load data
    let savedBill = defaults.float(forKey: "bill")
    let savedTip = defaults.float(forKey: "tip")
    let savedTotal = defaults.float(forKey: "total")
    let savedTipPercent = defaults.integer(forKey: "tip_percent")
    if savedBill != 0 {
      billField.text = String(format: "%.2f", savedBill)
      tipLabel.text = String(format: "$%.2f", savedTip)
      totalLabel.text = String(format: "$%.2f", savedTotal)
      tipControl.selectedSegmentIndex = savedTipPercent
      print("time passed: ", NSDate().timeIntervalSince1970 - savedStartTime)
    }
  }
  
  @IBAction func onTap(_ sender: Any) {
    print("hello")
    
    view.endEditing(true)
  }
  
  @IBAction func calculateTip(_ sender: Any) {
    //get the bill amount
    let bill = Double(billField.text!) ?? 0
    //calculate the tip and total
    let tipPercentages = [0.15, 0.18, 0.2]
    
    let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
    let total = bill + tip
    //update the tip and total labels
    tipLabel.text = String(format: "$%.2f", tip)
    totalLabel.text = String(format: "$%.2f", total)
    
    //Save data to load when app restart
    let defaults = UserDefaults.init()
    defaults.set(tip, forKey: "tip")
    defaults.set(bill, forKey: "bill")
    defaults.set(total, forKey: "total")
    defaults.set(tipControl.selectedSegmentIndex, forKey: "tip_percent")
    defaults.set(NSDate().timeIntervalSince1970, forKey: "start_time")
  }
}

