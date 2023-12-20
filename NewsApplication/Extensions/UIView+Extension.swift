//
//  UIView+Extension.swift
//  NewsApplication
//
//  Created by Space Wizard on 12/20/23.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
