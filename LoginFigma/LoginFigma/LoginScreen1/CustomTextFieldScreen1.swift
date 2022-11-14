//
//  CustomTextFieldScreen1.swift
//  LoginFigma
//
//  Created by Toan Tran on 31/10/2022.
//

import UIKit

@objc protocol CustomTextFieldScreenDelegate: AnyObject {
   @objc optional func floatingTextFieldRightViewClick(_ textField: UITextField)
}



class CustomTextFieldScreen1: UITextField, UITextFieldDelegate {
    public var txtDelegate: CustomTextFieldScreenDelegate?
    var leftPaddingIcon: CGFloat = 0
    
    @IBOutlet
    public var CustomTextFieldScreenDelegate: AnyObject? {
        get { return delegate as AnyObject }
        set { txtDelegate = newValue as? CustomTextFieldScreenDelegate }
    }
    
    var textPadding = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding
        return textRect
    }
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateRightView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0
    
    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            leftImageView.image = image
            leftView = leftImageView
            leftViewMode = .always
            textPadding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
        } else {
            
        }
    }
    
    func updaterightView() {
    }
    
    
}

extension CustomTextFieldScreen1 {
    func updateRightView() {
        if let image = rightImage {
            self.delegate = self
            let btnRightView = UIButton(frame: CGRect(
                x: 0.0,
                y: 0,
                width: self.frame.size.width,
                height: self.frame.size.height
            ))
            
            btnRightView.setImage(image, for: .normal)
            btnRightView.setImage(UIImage(systemName: "eye.slash"), for: .selected)
            
            self.rightViewMode = .always
            self.rightView = btnRightView
            btnRightView.addTarget(
                self,
                action: #selector(self.rightViewButtonClick(_:)),
                for: .touchUpInside
            )
        }
        
    }
    
    @objc func rightViewButtonClick(_ sender : UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.isSecureTextEntry = false
        } else {
            self.isSecureTextEntry = true
        }
        
    }
    
}

extension CustomTextFieldScreen1 {
        override func textRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.textRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.editingRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }
}

