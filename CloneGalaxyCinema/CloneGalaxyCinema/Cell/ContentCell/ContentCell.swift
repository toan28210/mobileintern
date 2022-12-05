//
//  ContentCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit
protocol ContentCellDelegate: AnyObject {
    func test(_ id: Int)
}

class ContentCell: UICollectionViewCell {
    static let identifier = "ContentCell"
    static func nib() -> UINib {
        return UINib(nibName: ContentCell.identifier, bundle: .main)
    }
    @IBOutlet weak var radioButton: UIButton!
    @IBOutlet weak var limitAgeLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentNameLb: UILabel!
    @IBOutlet weak var contentEvaluate: UILabel!
    @IBOutlet weak var contentLimitAge: UILabel!
    var id: Int = 0
    weak var delegate: ContentCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupRadioButton()
    }
    private func setupView() {
        contentImageView.layer.cornerRadius = 5
        limitAgeLabel.layer.cornerRadius = 5
        limitAgeLabel.layer.backgroundColor = CGColor(red: 209/255, green: 126/255, blue: 67/255, alpha: 1)
        radioButton.isHidden = true
    }
    private func setupRadioButton() {
        radioButton.setImage(UIImage(named: "img-uncheck-image"), for: .normal)
        radioButton.setImage(UIImage(named: "img-check-image"), for: .selected)
    }
    func configure(data: FlimDataModel) {
        contentImageView.image = UIImage(named: data.flimImage)
        contentNameLb.text = data.flimName
        contentEvaluate.text = data.evaluate
        contentLimitAge.text = data.limitAge
        id = data.id
        if data.showHome {
            radioButton.isSelected = true
        } else {
            radioButton.isSelected = false
        }
    }

    @IBAction func checkSelected(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        delegate?.test(id)
    }
}
