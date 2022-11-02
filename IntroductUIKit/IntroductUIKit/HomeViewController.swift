//
//  HomeViewController.swift
//  IntroductUIKit
//
//  Created by Toan Tran on 26/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationBarItem()
        
    }
    private func setUpNavigationBarItem() {
        let titleImageView = UIImageView(image: UIImage(named: "title_image"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        let followButton = UIButton(type: .system)
        followButton.setImage(UIImage(named: "title_image" ), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }

    @IBAction func hanleCalculate(_ sender: UIButton) {
        let calculate = CalculateViewController()
        self.navigationController?.pushViewController(calculate, animated: true)
    }
    
}
