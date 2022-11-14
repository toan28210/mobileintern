//
//  LoginScreenOneViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 31/10/2022.
//

import UIKit

class LoginScreenOneViewController: UIViewController {
    @IBOutlet weak private var loginAction: UILabel!
    @IBOutlet weak private var emailTxt: CustomTextFieldScreen1!
    @IBOutlet weak private var passwordTxt: CustomTextFieldScreen1!
    @IBOutlet weak private var loginBtn: UIButton!
    @IBOutlet weak private var rememberBtn: UIButton!
    
    @IBOutlet weak var lbLogoLogin: UILabel!
    let userDefault = UserDefaults.standard
    
    var email: String {
        get {
            guard let email = emailTxt.text else {
                return ""
            }
            return email
        }
    }
    
    var pass: String {
        get {
            guard let pass = passwordTxt.text else {
                return ""
            }
            return pass
        }
    }
    
    var validation = ValidationTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rememberBtn.setImage(UIImage(named: "img-uncheck-image"), for: .normal)
        rememberBtn.setImage(UIImage(named: "img-check-image"), for: .selected)
    }
    override func viewDidAppear(_ animated: Bool) {
        addBorderButton()
        checkboxRemember()
    }
    
    
    func addBorderButton() {
        loginAction.addBottomBorderWithColor(color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1), width: 2)
        emailTxt.addBottomBorderWithColor(color: UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), width: 2)
        passwordTxt.addBottomBorderWithColor(color: UIColor(red: 0.65, green: 0.65, blue: 0.65, alpha: 1), width: 2)
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        checkRememberClickLogin()
        print("login")
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
    
    @IBAction func rememberPassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    func checkboxRemember() {
        if let emailRemember = userDefault.string(forKey: "emailRemember"), let passRemember = userDefault.string(forKey: "passRemember") {
            emailTxt.text = emailRemember
            passwordTxt.text = passRemember
            rememberBtn.isSelected = !rememberBtn.isSelected
        }
        
    }
    func checkRememberClickLogin() {
        if rememberBtn.isSelected {
            userDefault.set(email, forKey: "emailRemember")
            userDefault.set(pass, forKey: "passRemember")
        } else {
            userDefault.removeObject(forKey: "emailRemember")
            userDefault.removeObject(forKey: "passRemember")
        }
    }
    
    
}

