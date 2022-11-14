//
//  CustomStyle.swift
//  IntroductUIKit
//
//  Created by Toan Tran on 14/11/2022.
//

import Foundation
import UIKit

extension UIButton {
    func customButtonStyle() {
        self.backgroundColor = UIColor(cgColor: CGColor(red: 242/255, green: 147/255, blue: 59/255, alpha: 1))
        self.layer.cornerRadius = self.frame.size.width/2
        self.tintColor = .white
    }
    func animatedButton() {
        self.backgroundColor = .white
        self.tintColor = UIColor(cgColor: CGColor(red: 242/255, green: 147/255, blue: 59/255, alpha: 1))
    }
}
