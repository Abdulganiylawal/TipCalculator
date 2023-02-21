//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Lawal Abdulganiy on 21/02/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var informationLabbel: UILabel!
    var tipBrain = TipLogic()
    var value: String?
    var label : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = value
        informationLabbel.text = label

    }
    
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
