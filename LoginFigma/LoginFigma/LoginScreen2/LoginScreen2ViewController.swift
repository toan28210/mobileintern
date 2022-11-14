//
//  LoginScreen2ViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 08/11/2022.
//

import UIKit

class LoginScreen2ViewController: UIViewController {

    @IBOutlet weak private var emailTextField: BaseTextField!
    @IBOutlet weak private var rememberBtn: UIButton!
    @IBOutlet weak private var passTxt: BaseTextField!
    @IBOutlet weak private var loginBtn: UIButton!
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var upImage: UIImageView!
    @IBOutlet weak private var belowImageView: UIImageView!
    var email: String {
        get {
            guard let email = emailTextField.text else {
                return ""
            }
            return email
        }
    }
    
    var pass: String {
        get {
            guard let pass = passTxt.text else {
                return ""
            }
            return pass
        }
    }
    
    var validation = ValidationTextField()
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxRemember()
        setImageButton()
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
    
    @IBAction func rememberPassword(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    func checkboxRemember() {
        if let emailRemember = userDefault.string(forKey: "emailRemember"), let passRemember = userDefault.string(forKey: "passRemember") {
            emailTextField.text = emailRemember
            passTxt.text = passRemember
            rememberBtn.isSelected = !rememberBtn.isSelected
            loginBtn.isEnabled = true
        }
        
    }

    @IBAction func hanleLogin(_ sender: Any) {
        checkRememberClickLogin()
        print("Login Success")
    }
    
    func setImageButton() {
        rememberBtn.setImage(UIImage(named: "img-uncheck-image"), for: .normal)
        rememberBtn.setImage(UIImage(named: "img-check-image"), for: .selected)
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
