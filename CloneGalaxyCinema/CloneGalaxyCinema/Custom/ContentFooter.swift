//
//  ContentFooter.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 18/11/2022.
//

import UIKit

protocol ContentFooterDelegate: AnyObject {
    func didTabSeeMore(_ button: UIButton)
}

class ContentFooter: UIView {
    weak var delegate: ContentFooterDelegate?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var seeMoreBtn: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    private func setupView() {
        Bundle.main.loadNibNamed("ContentFooter", owner: self)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        delegate?.didTabSeeMore(seeMoreBtn)
    }
}
