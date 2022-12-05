//
//  FooterScrollCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 21/11/2022.
//

import UIKit

class FooterScrollCell: UICollectionViewCell {
    static let identifier = "FooterScrollCell"
    static func nib() -> UINib {
        return UINib(nibName: FooterScrollCell.identifier, bundle: .main)
    }
    var timer: Timer?
    var currentCellIndex = 0
    var footerItems: [SlideFooterDataModel] = []
    @IBOutlet weak var footerCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        timer = Timer.scheduledTimer(
            timeInterval: 5.0,
            target: self,
            selector: #selector(slideToNext),
            userInfo: nil,
            repeats: true)
    }

    @objc func slideToNext() {
        if currentCellIndex < footerItems.count - 1 {
            currentCellIndex += 1
        } else {
            currentCellIndex = 0
        }
        footerCollectionView.isPagingEnabled = false
        footerCollectionView.scrollToItem(
            at: IndexPath(item: currentCellIndex, section: 0),
            at: .centeredHorizontally,
            animated: true)
        footerCollectionView.isPagingEnabled = true
    }

    private func configureCollectionView() {
        footerCollectionView.delegate = self
        footerCollectionView.dataSource = self
        footerCollectionView.collectionViewLayout = createLayout()
        footerCollectionView.register(FooterCell.nib(), forCellWithReuseIdentifier: FooterCell.identifier)
    }
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(280),
                                              heightDimension: .absolute(250))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 12, bottom: 0, trailing: 12)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(280),
                                               heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension FooterScrollCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return footerItems.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FooterCell.identifier,
                                                            for: indexPath) as? FooterCell else {
            fatalError()
        }
        cell.configur(with: footerItems[indexPath.row])
        return cell
    }
}
