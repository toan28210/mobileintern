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
    var footerData: [SlideFooterData] = []
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
        if currentCellIndex < footerData.count - 1 {
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
        let layout = UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let itemSpacing: CGFloat = 5
            item.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing,
                                                         leading: itemSpacing,
                                                         bottom: itemSpacing,
                                                         trailing: itemSpacing)
            let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                                         heightDimension: .fractionalWidth(0.7))
            let nestedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: nestedGroupSize,
                                                                 subitems: [item])
            // section
            let section = NSCollectionLayoutSection(group: nestedGroup)
            section.orthogonalScrollingBehavior = .groupPagingCentered
            return section
        }
        // layout
        return layout
    }
}

extension FooterScrollCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return footerData.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FooterCell.identifier,
                                                            for: indexPath) as? FooterCell else {
            fatalError()
        }
        cell.configur(with: footerData[indexPath.row])
        return cell
    }
}
