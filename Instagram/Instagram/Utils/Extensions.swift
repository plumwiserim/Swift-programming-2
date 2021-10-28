//
//  Extensions.swift
//  Instagram
//
//  Created by SW_mac04 on 2021/10/28.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

