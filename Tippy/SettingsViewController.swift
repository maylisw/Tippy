//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Maÿlis Whetsel on 7/14/20.
//  Copyright © 2020 Maÿlis Whetsel. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var defaultPicker: UIPickerView!
    let pickerData = ["15%", "18%", "20%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        // Connect data:
        defaultPicker.delegate = self
        defaultPicker.dataSource = self
        
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "myTipIndex")
        defaultPicker.selectRow(tipDefault, inComponent: 0, animated: false)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //only one column
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count //three rows of data
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: "myTipIndex")
        
        defaults.synchronize()
    }
    
    @IBAction func themeChange(_ sender: Any) {
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
