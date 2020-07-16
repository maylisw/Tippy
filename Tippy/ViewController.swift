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
    @IBOutlet weak var billPerPerson: UILabel!
    
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleCounter: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        billField.becomeFirstResponder()
        
        //get tips
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "myTipIndex")
        tipControl.selectedSegmentIndex = tipDefault
        tipControl.setEnabled(true, forSegmentAt: tipDefault)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        // get bill from defaults and set view
        let bill = defaults.double(forKey: "myBill")
        if bill == 0.0 {
            billField.text = ""
        } else {
            billField.text = String(format: "%.2f", bill)
        }
        
        //set up tip and total
        tipLabel.text = formatter.string(for: 0)
        totalLabel.text = formatter.string(for: 0)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        //store bill for later
        let defaults = UserDefaults.standard
        defaults.set(bill, forKey: "myBill")
        defaults.synchronize()
        
        //tip percents
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip =  tipPercentages[tipControl.selectedSegmentIndex] * bill
        
        // Should format based on phone locale
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
    
        //tip and total
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: bill+tip))
        
        //check number of people
        let people = Int(peopleCounter.value)
        peopleLabel.text = String(people)
        if people != 1 {
            billPerPerson.text = formatter.string(from: NSNumber(value: (bill+tip)/Double(people)))
        } else {
            billPerPerson.text = ""
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard
        let tipDefault = defaults.integer(forKey: "myTipIndex")
        tipControl.selectedSegmentIndex = tipDefault
        tipControl.setEnabled(true, forSegmentAt: tipDefault)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let bill = defaults.double(forKey: "myBill")
        if bill == 0.0 {
            billField.text = ""
        } else {
            billField.text = String(format: "%.2f", bill)
        }
        calculateTip(self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    

}

