//
//  Dialog.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 22/11/2022.
//

import UIKit
import ALRadioButtons

class Dialog: UIView {
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
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    private func setupConstraints() {
    }
    @IBAction func handleClose(_ sender: UIButton) {
        print("close")
    }

    @IBAction func handleConfirm(_ sender: UIButton) {
        print("confirm")
    }

}
