//
//  LoginScreen3ViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 01/11/2022.
//

import UIKit

class LoginScreen3ViewController: UIViewController {

    @IBOutlet weak var loginWithLKView: UIView!
    @IBOutlet weak var loginWithInTaView: UIView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var loginWithFBView: UIView!
    @IBOutlet weak var emailTxt: BaseTextField!
    @IBOutlet weak var passTxt: BaseTextField!
    @IBOutlet weak var rememberBtn: UIButton!
    
    let validation = ValidationTextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        customTxt(txt: emailTxt)
        customTxt(txt: passTxt)
        //shadow view
        
        customShadowView(view: loginWithFBView)
        customShadowView(view: loginWithInTaView)
        customShadowView(view: loginWithLKView)
        
        loginBtn.isEnabled = false
        
    }
    func customTxt(txt: UITextField) {
        txt.layer.borderWidth = 1
        txt.layer.cornerRadius = 21
        txt.layer.shadowRadius = 10
        txt.layer.shadowOffset = CGSize(width: 0, height: 2)
        txt.layer.shadowOpacity = 0.5
        txt.layer.shadowColor = UIColor.gray.cgColor
        txt.layer.shadowPath = UIBezierPath(rect: txt.bounds).cgPath
    }
    func customShadowView(view: UIView) {
        view.layer.cornerRadius = 17
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
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

    @IBAction func rememberPassword(_ sender: Any) {
        
    }
    @IBAction func handleLogin(_ sender: Any) {
        print("Login")
    }
    
}
