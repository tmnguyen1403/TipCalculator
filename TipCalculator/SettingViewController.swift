//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Tom Riddle on 9/5/20.
//  Copyright © 2020 Tom Riddle. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

  @IBOutlet weak var backgroundColorSegments: UISegmentedControl!
  let key_background = "backgroundColor"
  override func viewWillAppear(_ animated: Bool) {
    backgroundColorSegments.selectedSegmentIndex = getSelectedBackgroundIndex()
    changeTintColor(index: backgroundColorSegments.selectedSegmentIndex)
  }
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  func changeTintColor(index: Int) {
    let colorOptions = [UIColor.white, UIColor.systemBlue, UIColor.systemRed, UIColor.systemPink]
     backgroundColorSegments.selectedSegmentTintColor = colorOptions[index]
  }
  
  func getSelectedBackgroundIndex() -> Int {
    let userDefault = UserDefaults.init()
    return userDefault.integer(forKey: key_background)
  }
  
  func setSelectedBackgroundIndex(value: Int) {
    let userDefault = UserDefaults.init()
    userDefault.set(value, forKey: key_background)
    userDefault.synchronize()
  }
  @IBAction func changeBackgroundColor(_ sender: Any) {
    let index = backgroundColorSegments.selectedSegmentIndex
    setSelectedBackgroundIndex(value: index)
    changeTintColor(index: index)
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
