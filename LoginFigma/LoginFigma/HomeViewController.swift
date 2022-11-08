//
//  HomeViewController.swift
//  LoginFigma
//
//  Created by Toan Tran on 04/11/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let userDefault = UserDefaults.standard
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var logoutBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = userDefault.string(forKey: "email")
        nameLbl.text = email
    }

    @IBAction func handleLogout(_ sender: UIButton) {
    }
    
    
    
    
}
