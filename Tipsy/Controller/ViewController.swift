//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var twentyPercentage: UIButton!
    @IBOutlet weak var tenPercentage: UIButton!
    @IBOutlet weak var zeroPercentage: UIButton!
    var tipBrain = TipLogic()
    var tip: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func tipButtonPressed(_ sender: UIButton) {
        tip = sender.currentTitle
        updateTipUI(sender: tip!)
        billLabel.endEditing(true)
    }
    
    @IBAction func splitCounter(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.f" ,sender.value)

    }
    
    @IBAction func calculate(_ sender: UIButton) {
        tipBrain.setData(bill: billLabel.text!, tips: tip!, split: splitLabel.text!)
        let segueIdentifier = "toGoTotal"
       
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGoTotal" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.value = String(tipBrain.calculate())
            destinationVC.label = "Split between \((tipBrain.tipLogic?.split)!) people, with \(String(format:"%.f", (tipBrain.tipLogic?.tipPercentage ?? 0) * 100))% tip"
            }
    }
    
    func updateTipUI(sender: String) {
        switch sender {
        case "0%":
            zeroPercentage.isSelected = true
            tenPercentage.isSelected = false
            twentyPercentage.isSelected = false
        case "10%":
            zeroPercentage.isSelected = false
            tenPercentage.isSelected = true
            twentyPercentage.isSelected = false
        case "20%":
            zeroPercentage.isSelected = false
            tenPercentage.isSelected = false
            twentyPercentage.isSelected = true
        default:
            break
        }
    }
}

