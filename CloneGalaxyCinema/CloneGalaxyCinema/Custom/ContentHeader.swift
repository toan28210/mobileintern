//
//  ContentHeader.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 21/11/2022.
//

import UIKit
protocol ContentHeaderDelegate: AnyObject {
    func changeDataNowContent(_ headerIndex: Int)
    func changeDataComContent(_ headerIndex: Int)
    func dialog()
}
protocol ContentHeaderDataSource: AnyObject {
    func dialogData() -> String
}

class ContentHeader: UIView {
    weak var delegate: ContentHeaderDelegate?
    weak var datasource: ContentHeaderDataSource?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var comingBtn: UIButton!
    @IBOutlet weak var nowBtn: UIButton!
    @IBOutlet weak var addressBtn: UIButton!
    var headerIndex = 0
    var data: [FlimDataModel] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        Bundle.main.loadNibNamed("ContentHeader", owner: self)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    func updateButtonUI() {
        if headerIndex == 0 {
            nowBtn.setTitleColor(.link, for: .normal)
            nowBtn.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
            comingBtn.setTitleColor(.gray, for: .normal)
            comingBtn.titleLabel?.font = UIFont(name: "Helvetica", size: 17)
        } else {
            nowBtn.setTitleColor(.gray, for: .normal)
            nowBtn.titleLabel?.font = UIFont(name: "Helvetica", size: 17)
            comingBtn.setTitleColor(.link, for: .normal)
            comingBtn.titleLabel?.font = UIFont(name: "Helvetica", size: 18)
        }
    }

    @IBAction func handleLocation(_ sender: UIButton) {
        delegate?.dialog()
    }
    @IBAction func didTabButton(_ sender: UIButton) {
        if sender.tag == 0 {
            headerIndex = 0
            addressBtn.isEnabled = true
            delegate?.changeDataNowContent(headerIndex)
        } else {
            headerIndex = 1
            addressBtn.isEnabled = false
            delegate?.changeDataComContent(headerIndex)
        }
        updateButtonUI()
    }
}
