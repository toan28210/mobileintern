//
//  LoginViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 28/10/2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTxt: BaseTextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    let validation = ValidationTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func changeEmail(_ sender: Any) {
        if let email = emailTextField.text {
            if validation.invalidEmail(email){
                loginBtn.isEnabled = true
            } else {
                print("Invalid Email Address")
                loginBtn.isEnabled = false
            }
        }
    }
    
    @IBAction func changePass(_ sender: Any) {
        if let password = passTxt.text {
            if validation.invalidPassword(password){
                loginBtn.isEnabled = true
            } else {
                print("Minimum 8 characters at least 1 Alphabet, 1 Number and 1 Special Character")
                loginBtn.isEnabled = false
            }
        }
    }
}
