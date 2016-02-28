//
//  ViewController.swift
//  Tip2
//
//  Created by Thanh Dang on 2/27/16.
//  Copyright © 2016 Thanh Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billingField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTipIndex = defaults.integerForKey("default_tip_index")
        
        tipControl.selectedSegmentIndex = defaultTipIndex
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        let billingAmount = NSString(string: billingField.text!).doubleValue
        
        let tipPercentages = [0.18, 0.2, 0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let tip = billingAmount * tipPercentage
        let total = billingAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

