//
//  HeaderContent.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

protocol HeaderContentDelegate: AnyObject {
    func didTabData(_ sender: UIButton, data: ContentData)
}

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
        contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }

    func updateUIButton(_ index: Int) {
    }
}
