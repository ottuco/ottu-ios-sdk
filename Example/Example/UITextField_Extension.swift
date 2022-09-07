//
//  UITextField_Extension.swift
//  Example
//
//  Created by Maninder Singh on 04/09/22.
//

import Foundation
import UIKit

extension UITextField{
    
   
    var isEmpty: Bool {
        if self.text == nil || self.text == "" || self.text!.trimmingCharacters(in: .whitespaces) == "" {
            return true
        }
        return false
    }

    
}
