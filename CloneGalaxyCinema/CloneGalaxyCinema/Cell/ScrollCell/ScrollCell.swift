//
//  ScrollCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

class ScrollCell: UICollectionViewCell {
    static let identifier = "ScrollCell"
    static func nib() -> UINib {
        return UINib(nibName: ScrollCell.identifier, bundle: .main)
    }
    @IBOutlet weak var scrollImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        scrollImageView.layer.cornerRadius = 5
    }

    func cofigure(img: String) {
        scrollImageView.image = UIImage(named: img)
    }
}
