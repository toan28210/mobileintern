//
//  LoginScreenOneViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 31/10/2022.
//

import UIKit

class LoginScreenOneViewController: UIViewController {
    @IBOutlet weak var loginAction: UILabel!
    @IBOutlet weak var emailTxt: CustomTextFieldScreen1!
    @IBOutlet weak var passwordTxt: CustomTextFieldScreen1!
    @IBOutlet weak var loginBtn: UIButton!
    
    var validation = ValidationTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBorderButton()
    }
    
    func addBorderButton() {
        loginAction.addBottomBorderWithColor(color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1), width: 2)
        emailTxt.addBottomBorderWithColor(color: UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), width: 2)
        passwordTxt.addBottomBorderWithColor(color: UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), width: 2)
    }
    
    @IBAction func changeEmail(_ sender: Any) {
        if let email = emailTxt.text {
            if validation.invalidEmail(email){
                loginBtn.isEnabled = true
            } else {
                print("Invalid Email Address")
                loginBtn.isEnabled = false
            }
        }
    }
    
    
    @IBAction func changePass(_ sender: Any) {
        if let password = passwordTxt.text {
            if validation.invalidPassword(password){
                loginBtn.isEnabled = true
            } else {
                print("Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character")
                loginBtn.isEnabled = false
            }
        }
    }
}
