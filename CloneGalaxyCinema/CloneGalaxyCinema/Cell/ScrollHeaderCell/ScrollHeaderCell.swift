//
//  ScrollCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

class ScrollHeaderCell: UICollectionViewCell {
    static let identifier = "ScrollHeaderCell"
    static func nib() -> UINib {
        return UINib(nibName: ScrollHeaderCell.identifier, bundle: .main)
    }
    @IBOutlet weak var scrollImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       configureImageView()
    }
    private func configureImageView() {
        scrollImageView.layer.cornerRadius = 5
    }

    func cofigure(data: SlideHeaderDataModel) {
        scrollImageView.image = UIImage(named: data.slideHeaderImage)
    }
}
