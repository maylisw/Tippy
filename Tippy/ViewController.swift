//
//  ViewController.swift
//  Tippy
//
//  Created by Maÿlis Whetsel on 7/14/20.
//  Copyright © 2020 Maÿlis Whetsel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "myTipIndex")
        tipControl.selectedSegmentIndex = tipDefault
        tipControl.setEnabled(true, forSegmentAt: tipDefault)
        
        print(tipDefault)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        tipLabel.text = formatter.string(for: 0)
        totalLabel.text = formatter.string(for: 0)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip =  tipPercentages[tipControl.selectedSegmentIndex] * bill
        
        // Should format based on phone locale
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
    
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: bill+tip))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "myTipIndex")
        tipControl.selectedSegmentIndex = tipDefault
        tipControl.setEnabled(true, forSegmentAt: tipDefault)
        
        print(tipDefault)
    }
}

