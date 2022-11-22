//
//  ScrollFooter.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

class ScrollFooter: UICollectionReusableView {
    static let identifier = "ScrollFooter"
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .link
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
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
        self.frame.size.height = 50
        self.addSubview(pageControl)
    }

    func setupConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pageControl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    func currentPage(num: Int) {
    }
}
