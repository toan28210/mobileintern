//
//  HeaderContent.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

class HeaderContent: UICollectionReusableView {
    static let identifier = "HeaderContent"

    let contentView: ContentHeader = {
        let contentView = ContentHeader()
        return contentView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
        setupConstraints()
    }

    func setupViews() {
        self.addSubview(contentView)
    }
    func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
