//
//  ZipCodeTextField.swift
//  Text Fields (Various Functions)
//
//  Created by Brent Liang on 1/1/18.
//  Copyright © 2018 Brent Liang. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate 
class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.keyboardType = UIKeyboardType.numberPad
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = CharacterSet(charactersIn: "0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        
        if (textField.text?.characters.count)! <= 5 {
            return string == numberFiltered
        } else if string == "" {
            return true
        } else {
            return false
        }
    }
}
