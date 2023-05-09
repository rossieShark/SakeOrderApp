//
//  UIView+Exstension.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 09.05.23.
//

import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
        get { return  cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
