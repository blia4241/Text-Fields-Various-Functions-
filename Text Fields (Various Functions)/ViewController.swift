//
//  ViewController.swift
//  Text Fields (Various Functions)
//
//  Created by Brent Liang on 1/1/18.
//  Copyright © 2018 Brent Liang. All rights reserved.
//

import UIKit

// MARK: -ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var zipCodeField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableSwitch: UISwitch!
    
    // MARK: Text Field Delegate Objects
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = cashTextFieldDelegate()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the three delegates
        self.zipCodeField.delegate = zipCodeDelegate
        self.cashTextField.delegate = cashDelegate
        self.lockableTextField.delegate = self
    
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        if lockableSwitch.isOn == true {
            return true
        } else {
            return false
        }
    }
}

