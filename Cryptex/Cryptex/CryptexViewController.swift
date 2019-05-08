//
//  CryptexViewController.swift
//  Cryptex
//
//  Created by Jordan Davis on 5/8/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: -Actions

    @IBAction func unlockButtonPressed(_ sender: Any) {
        print("Unlock")
    }
    
    
    
    //MARK: -Properties
    
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var unlockButton: UIButton!
    @IBOutlet var cryptexPicker: UIPickerView!
    

}
