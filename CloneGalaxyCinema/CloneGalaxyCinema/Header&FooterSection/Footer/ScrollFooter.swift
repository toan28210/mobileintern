//
//  ScrollFooter.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

protocol HeaderScrollFooterDelegate: AnyObject {
    func slideToNext(_ index: Int)
}

class ScrollFooter: UICollectionReusableView {
    static let shared = ScrollFooter()
    static let identifier = "ScrollFooter"
    var timer: Timer?
    weak var delegate: HeaderScrollFooterDelegate?
    var currentSlideIndex = 0
    var currentNumberIndex = 0
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .link
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.currentPage = 0
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
        timer = Timer.scheduledTimer(
            timeInterval: 5.0,
            target: self,
            selector: #selector(slideToNext),
            userInfo: nil,
            repeats: true)
    }
    func setupViews() {
        self.addSubview(pageControl)
    }

    func setupConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }

    @objc func slideToNext() {
        if currentNumberIndex < currentSlideIndex - 1 {
            currentNumberIndex += 1
        } else {
            currentNumberIndex = 0
        }
        pageControl.currentPage = currentNumberIndex
        delegate?.slideToNext(currentNumberIndex)
    }
}
