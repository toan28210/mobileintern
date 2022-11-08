//
//  LoginScreen2ViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 08/11/2022.
//

import UIKit

class LoginScreen2ViewController: UIViewController {

    @IBOutlet weak var emailTextField: BaseTextField!
    @IBOutlet weak var rememberBtn: UIButton!
    @IBOutlet weak var passTxt: BaseTextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var upImage: UIImageView!
    @IBOutlet weak var belowImageView: UIImageView!
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
        
        loginBtn.isEnabled = false
        
        rememberBtn.setImage(UIImage(named: "img-uncheck-image"), for: .normal)
        rememberBtn.setImage(UIImage(named: "img-check-image"), for: .selected)
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
        }
        
    }

    @IBAction func hanleLogin(_ sender: Any) {
        checkRememberClickLogin()
        print("Login Success")
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
