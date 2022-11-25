//
//  FooterConentView.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 17/11/2022.
//

import UIKit

class FooterConentView: UICollectionReusableView {
    static let identifier = "FooterConentView"
    let superView: ContentFooter = {
        let superView = ContentFooter()
        return superView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        self.addSubview(superView)
    }

    private func setupConstraints() {
        superView.translatesAutoresizingMaskIntoConstraints = false
        superView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        superView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        superView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        superView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }

}
