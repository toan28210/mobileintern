//
//  ScrollCollectionViewCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit

class ScrollCollectionViewCell: UICollectionViewCell {
    static let identifier = "ScrollCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: ScrollCollectionViewCell.identifier, bundle: .main)
    }
    private var indexOfCellBeforeDragging = 0
    @IBOutlet weak var scrollCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    static let scrollImage = ["anh", "blackpanther", "anh", "blackpanther", "anh", "blackpanther"]
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
    private func configureCollectionView() {
        scrollCollectionView.delegate = self
        scrollCollectionView.dataSource = self
        scrollCollectionView.register(ScrollCell.nib(), forCellWithReuseIdentifier: ScrollCell.identifier)
        scrollCollectionView.collectionViewLayout = createLayout()
    }
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            let itemSpacing: CGFloat = 5
//            item.contentInsets = NSDirectionalEdgeInsets(top: itemSpacing,
//                                                         leading: itemSpacing,
//                                                         bottom: itemSpacing,
//                                                         trailing: itemSpacing)
            let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                                         heightDimension: .fractionalWidth(0.55))
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
extension ScrollCollectionViewCell: UICollectionViewDelegateFlowLayout,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return ScrollCollectionViewCell.scrollImage.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ScrollCell.identifier,
            for: indexPath) as? ScrollCell else {
            fatalError()
        }
        cell.cofigure(img: ScrollCollectionViewCell.scrollImage[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 220)
    }
}
