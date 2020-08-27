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
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
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
  }
}

