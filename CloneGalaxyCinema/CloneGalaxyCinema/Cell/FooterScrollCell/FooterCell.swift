//
//  FooterCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 21/11/2022.
//

import UIKit

class FooterCell: UICollectionViewCell {
    static let identifier = "FooterCell"
    static func nib() -> UINib {
        return UINib(nibName: FooterCell.identifier, bundle: .main)
    }

    @IBOutlet weak var footerTitleLb: UILabel!
    @IBOutlet weak var footerCellImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    func configure() {
        footerCellImageView.layer.cornerRadius = 5
    }
    func configur(with model: FooterScrollData) {
        footerTitleLb.text = model.title
        footerCellImageView.image = UIImage(named: model.image)
    }

}
