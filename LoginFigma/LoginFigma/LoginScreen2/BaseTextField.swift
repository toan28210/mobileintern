import UIKit

@IBDesignable
class BaseTextField: UITextField {
    var textPadding = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0
        )

    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        print("leftpadding \(leftPadding)")
        textRect.origin.x += leftPadding
        return textRect
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updaterightView()
        }
    }

    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    @IBInspectable var colorRight: UIColor = UIColor.lightGray {
        didSet {
            updaterightView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = color
            leftView = imageView
        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil
        }
    }
    
    func updaterightView() {
        if let image = rightImage {
            rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            imageView.tintColor = colorRight
            rightView = imageView
            layer.cornerRadius = 9
            layer.borderColor = UIColor(red: 0.8, green: 0.79, blue: 0.79, alpha: 1).cgColor
            layer.borderWidth = 1
            print(leftPadding)
            
        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }
        
        
    }
}
extension BaseTextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        textPadding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        textPadding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        return rect.inset(by: textPadding)
    }
}
