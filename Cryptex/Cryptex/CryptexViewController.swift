//
//  CryptexViewController.swift
//  Cryptex
//
//  Created by Jordan Davis on 5/8/19.
//  Copyright © 2019 Jordan Davis. All rights reserved.
//

import UIKit

class CryptexViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptexPicker.delegate = self
        cryptexPicker.dataSource = self
        
        updateViews()
    }
    
    var letters = ["A", "B", "C", "D",
                   "E", "F", "G", "H",
                   "I", "J", "K", "L",
                   "M", "N", "O", "P",
                   "Q", "R", "S", "T",
                   "U", "V", "W", "X",
                   "Y", "Z"]
    
    //MARK: -Data source and Delegate Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        guard let cryptex = cryptexController.currentCryptex else { return 0 }
        return cryptex.password.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return letters.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // For the title of each row, we want to show the letter that corresponds to the row. i.e. row 0 should show "A", row 1 should show "B", etc.
        return letters[row]
    }
    
    
    
    //MARK: -Update Views
    
    func updateViews() {
        guard let cryptexHint = cryptexController.currentCryptex?.hint else { return }
        hintLabel.text = cryptexHint
        cryptexPicker.reloadAllComponents()
    }
    
    //MARK: -Game Logic
    
    func hasMatchingPassword() -> Bool {
        let numberOfLetters = cryptexPicker.numberOfComponents
        
        var passwordEntered: [String] = []
        for letter in 0..<numberOfLetters{
            let currentComponent = cryptexPicker.selectedRow(inComponent: letter)
            passwordEntered.append(letters[currentComponent])
        }
        
        let passwordEnteredString = passwordEntered.joined(separator: "").lowercased()
        if passwordEnteredString == cryptexController.currentCryptex?.password {
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        countdownTimer?.invalidate()
        _ = Timer.scheduledTimer(withTimeInterval: 60.00, repeats: false) { (countdownTimer) in
            self.presentNoTimeRemainingAlert()
        }
    }
    
    func newCryptexAndReset() {
        cryptexController.randomCryptex()
        updateViews()
        reset()
    }
    
    //MARK: - Alerts
    func presentCorrectPasswordAlert() {
        
        let alert = UIAlertController(title: "Correctamundo!", message: "Congrats! You're smart!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try new cryptex", style: .default, handler: { (alert) in self.newCryptexAndReset()}))
        present(alert, animated: true, completion: nil)
    }
    
    func presentIncorrectPasswordAlert() {
        let alert = UIAlertController(title: "Wrong!", message: "If I chose as bad as you, I'd try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue guessing!", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func presentNoTimeRemainingAlert() {
        let alert = UIAlertController(title: "No Time", message: "You ran out of time! Would you like to reset the timer?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Reset Timer", style: .default, handler: { (alert) in self.reset()}))
        alert.addAction(UIAlertAction(title: "Try new cryptex", style: .default, handler: { (alert) in self.newCryptexAndReset()}))
        present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: -Actions

    @IBAction func unlockButtonPressed(_ sender: Any) {
        if hasMatchingPassword() {
            presentCorrectPasswordAlert()
        } else {
            presentIncorrectPasswordAlert()
        }
    }
    
    
    
    //MARK: -Properties
    
    @IBOutlet var hintLabel: UILabel!
    @IBOutlet var unlockButton: UIButton!
    @IBOutlet var cryptexPicker: UIPickerView!
    
    var cryptexController = CryptexController()
    
    @objc var countdownTimer: Timer?

}
