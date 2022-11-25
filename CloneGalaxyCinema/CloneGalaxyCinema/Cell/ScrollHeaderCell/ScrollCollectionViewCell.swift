//
//  ScrollCollectionViewCell.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 16/11/2022.
//

import UIKit
protocol ScrollCollectionViewCellDelegate: AnyObject {
    func nextSlide(_ collectionView: UICollectionView)
}

class ScrollCollectionViewCell: UICollectionViewCell {
    static let identifier = "ScrollCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: ScrollCollectionViewCell.identifier, bundle: .main)
    }
    private var indexOfCellBeforeDragging = 0
    var currentCellIndex = 0
    weak var delegate: ScrollCollectionViewCellDelegate?
    @IBOutlet weak var scrollCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    var scrollImage: [SlideHeaderDataModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        delegate?.nextSlide(scrollCollectionView)
        registerCollectionView()
    }
    private func configureCollectionView() {
        scrollCollectionView.delegate = self
        scrollCollectionView.dataSource = self
        scrollCollectionView.collectionViewLayout = createLayout()
    }

    private func registerCollectionView() {
        scrollCollectionView.register(ScrollHeaderCell.nib(), forCellWithReuseIdentifier: ScrollHeaderCell.identifier)
    }
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (_, _) -> NSCollectionLayoutSection? in
            let inset: CGFloat = 5
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(
                top: inset,
                leading: inset,
                bottom: inset,
                trailing: inset)
            let nestedGroupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.85),
                heightDimension: .fractionalWidth(0.6))
            print(nestedGroupSize)
            let nestedGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: nestedGroupSize,
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
        return scrollImage.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ScrollHeaderCell.identifier,
            for: indexPath) as? ScrollHeaderCell else {
            fatalError()
        }
        cell.cofigure(data: scrollImage[indexPath.row])
        return cell
    }
}
