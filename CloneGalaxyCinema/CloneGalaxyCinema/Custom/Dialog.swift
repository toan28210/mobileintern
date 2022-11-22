//
//  Dialog.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 22/11/2022.
//

import UIKit
import ALRadioButtons

class Dialog: UIView {
    lazy var radioGroup = ALRadioGroup(items: [
            .init(title: "title1", subtitle: "subtitle1"),
            .init(title: "title2", subtitle: "subtitle2", detail: "Detail"),
            .init(title: "title3")
        ], style: .grouped)
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var locationLb: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }

    private func setupView() {
        Bundle.main.loadNibNamed("Dialog", owner: self)
        self.addSubview(contentView)
        self.addSubview(radioGroup)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func setupConstraints() {
        radioGroup.translatesAutoresizingMaskIntoConstraints = false
        radioGroup.topAnchor.constraint(equalTo: locationLb.bottomAnchor, constant: 20).isActive = true
        radioGroup.leadingAnchor.constraint(equalTo: dialogView.leadingAnchor, constant: 10).isActive = true
        radioGroup.trailingAnchor.constraint(equalTo: dialogView.trailingAnchor, constant: -10).isActive = true
        radioGroup.bottomAnchor.constraint(equalTo: closeBtn.topAnchor, constant: 10).isActive = true
    }
    
    
    
    @IBAction func handleClose(_ sender: UIButton) {
        print("close")
    }
    
    @IBAction func handleConfirm(_ sender: UIButton) {
        print("confirm")
    }
    
}
