//
//  ContentCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

class ContentCell: UICollectionViewCell {
    static let identifier = "ContentCell"
    static func nib() -> UINib {
        return UINib(nibName: ContentCell.identifier, bundle: .main)
    }
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var contentNameLb: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentImageView.layer.cornerRadius = 5
    }
    func configure(data: FlimDataModel) {
        contentImageView.image = UIImage(named: data.flimImage)
        contentNameLb.text = data.flimName
    }

}
