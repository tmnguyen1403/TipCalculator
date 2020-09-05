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
  var currencySymbol : String = ""
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    //Toggle keyboard for billField when the app is launched
    self.billField.becomeFirstResponder()
    print("view DidLoad")
    //TODO: Get locale currency and separator
    let locale = Locale.current
    currencySymbol = locale.currencySymbol ?? "$" //default is $
    
    if let currentcySymbol = locale.currencySymbol {
      print("currency ", currentcySymbol)
    }
    if let separator = locale.decimalSeparator {
      print("separator ", separator)
    }
    //if app restart, load the data from previous calculation
    loadData()
  }
  
  func showThousandSeparator(value : Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.usesGroupingSeparator = true
    numberFormatter.groupingSeparator = Locale.current.groupingSeparator ?? "."
    numberFormatter.groupingSize = 3
    return numberFormatter.string(for: value) ?? "0"
  }
  
  func setAmount(label: UILabel,value : Double = 0) {
    let rounded_value = round(value * 100) / 100 //Round to 2 decimals
    let value_str = showThousandSeparator(value: rounded_value)
    label.text = "\(currencySymbol)\(value_str)"
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
    let savedBill = defaults.double(forKey: "bill")
    let savedTip = defaults.double(forKey: "tip")
    let savedTotal = defaults.double(forKey: "total")
    let savedTipPercent = defaults.integer(forKey: "tip_percent")
    if savedBill != 0 {
      billField.text = String(format: "%.2f", savedBill)
      setAmount(label: tipLabel, value: savedTip)
      setAmount(label: totalLabel, value: savedTotal)
      tipControl.selectedSegmentIndex = savedTipPercent
      print("time passed: ", NSDate().timeIntervalSince1970 - savedStartTime)
    } else {
      setAmount(label: tipLabel)
      setAmount(label: totalLabel)
    }
  }
  
  /*
   **Input: a decimal number represents in string which use "comma" as decimal separator
   **Ouput: a decimal number string use "dot" as decimal separator
   */
  func replaceCommaWithDot(str : String) -> String {
    let range = NSRange(location: 0, length: str.utf16.count)
    let regex = try! NSRegularExpression(pattern: ",")
    let new_str = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: ".")
    return new_str
  }
  
  @IBAction func onTap(_ sender: Any) {
    print("hello")
    
    view.endEditing(true)
  }
  
  @IBAction func calculateTip(_ sender: Any) {
    //get the bill amount
    let formatted_bill = replaceCommaWithDot(str: billField.text ?? "0")
    let bill = Double(formatted_bill) ?? 0
    //calculate the tip and total
    let tipPercentages = [0.15, 0.18, 0.2]
    
    let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
    let total = bill + tip
    //update the tip and total labels
    setAmount(label: tipLabel, value: tip)
    setAmount(label: totalLabel, value: total)
    
    //Save data to load when app restart
    let defaults = UserDefaults.init()
    defaults.set(tip, forKey: "tip")
    defaults.set(bill, forKey: "bill")
    defaults.set(total, forKey: "total")
    defaults.set(tipControl.selectedSegmentIndex, forKey: "tip_percent")
    defaults.set(NSDate().timeIntervalSince1970, forKey: "start_time")
  }
}

