//
//  LoginScreen3ViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 01/11/2022.
//

import UIKit

class LoginScreen3ViewController: UIViewController {
    
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
            guard let pass = passTxt.text else {
                return ""
            }
            return pass
        }
    }

    @IBOutlet weak private var loginWithLKView: UIView!
    @IBOutlet weak private var loginWithInTaView: UIView!
    @IBOutlet weak private var loginBtn: UIButton!
    @IBOutlet weak private var loginWithFBView: UIView!
    @IBOutlet weak private var emailTxt: BaseTextField!
    @IBOutlet weak private var passTxt: BaseTextField!
    @IBOutlet weak private var rememberBtn: UIButton!
    
    let validation = ValidationTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkboxRemember()
        setImageBtn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        addShadowView()
    }
    func setImageBtn() {
        rememberBtn.setImage(UIImage(named: "img-uncheck-image"), for: .normal)
        rememberBtn.setImage(UIImage(named: "img-check-image"), for: .selected)
    }
    func addShadowView(){
        loginWithFBView.customShadowView(borderWith: 0, radius: 17)
        loginWithInTaView.customShadowView(borderWith: 0, radius: 17)
        loginWithLKView.customShadowView(borderWith: 0,radius: 17)
        emailTxt.customShadowView(borderWith: 1, radius: 21)
        passTxt.customShadowView(borderWith: 1, radius: 21)
        
    }
    //Validation
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
    
    @IBAction func changePassword(_ sender: Any) {
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
    @IBAction func handleLogin(_ sender: UIButton) {
        checkRememberClickLogin()
        print("login")
//        userDefault.set(email, forKey: "email")
//        let homeVC = HomeViewController()
//        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func checkboxRemember() {
        if let emailRemember = userDefault.string(forKey: "emailRemember"), let passRemember = userDefault.string(forKey: "passRemember") {
            emailTxt.text = emailRemember
            passTxt.text = passRemember
            rememberBtn.isSelected = !rememberBtn.isSelected
            loginBtn.isEnabled = true
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
