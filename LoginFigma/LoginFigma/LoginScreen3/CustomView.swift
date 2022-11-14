//
//  CustomView.swift
//  LoginFigma
//
//  Created by Toan Tran on 14/11/2022.
//

import Foundation
import UIKit


extension UIView {
    func customShadowView(borderWith: CGFloat, radius: CGFloat) {
        self.layer.borderWidth = borderWith
        self.layer.cornerRadius = radius
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}

