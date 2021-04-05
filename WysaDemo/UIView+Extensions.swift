//
//  UIView+Extensions.swift
//  WysaDemo
//
//  Created by Rakshith N on 04/04/21.
//

import UIKit

extension UIView{
    
    func addConstraintSubViews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(view)
        }
    }
    
}
