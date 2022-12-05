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
    var currentCellIndex = 0
    var timer = Timer()
    @IBOutlet weak var scrollCollectionView: UICollectionView!
    var items: [SlideHeaderDataModel] = []
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        registerCollectionView()
        setupCollectionViewLayout()
    }
    private func configureCollectionView() {
        scrollCollectionView.delegate = self
        scrollCollectionView.dataSource = self
    }
    private func setupCollectionViewLayout() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            scrollCollectionView.collectionViewLayout = createLayoutPad()
        } else {
            scrollCollectionView.collectionViewLayout = createLayout()
        }
    }
    private func registerCollectionView() {
        scrollCollectionView.register(ScrollHeaderCell.nib(), forCellWithReuseIdentifier: ScrollHeaderCell.identifier)
        scrollCollectionView.register(ScrollFooter.self,
                                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                      withReuseIdentifier: ScrollFooter.identifier)
    }
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(340),
                                              heightDimension: .absolute(230))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(340),
                                               heightDimension: .absolute(230))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize,
                                                                 elementKind: UICollectionView.elementKindSectionFooter,
                                                                 alignment: .bottom)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32)
        section.boundarySupplementaryItems = [footer]
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    private func createLayoutPad() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(500),
                                              heightDimension: .absolute(400))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 8, bottom: 0, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(500),
                                               heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerHeaderSize,
                                                                 elementKind: UICollectionView.elementKindSectionFooter,
                                                                 alignment: .bottom)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32)
        section.boundarySupplementaryItems = [footer]
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
extension ScrollCollectionViewCell: UICollectionViewDelegateFlowLayout,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ScrollHeaderCell.identifier,
            for: indexPath) as? ScrollHeaderCell else {
            fatalError()
        }
        cell.cofigure(data: items[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(collectionViewLayout.accessibilityFrame.size.width)
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
    // Footer Collection View
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let footerSlideHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: ScrollFooter.identifier,
            for: indexPath) as? ScrollFooter else {
            return ScrollFooter()
        }
        footerSlideHeader.pageControl.numberOfPages = items.count
        footerSlideHeader.currentSlideIndex = items.count
        footerSlideHeader.delegate = self
        return footerSlideHeader
    }
}

extension ScrollCollectionViewCell: HeaderScrollFooterDelegate {
    func slideToNext(_ index: Int) {
        scrollCollectionView.isPagingEnabled = false
        scrollCollectionView.scrollToItem(
            at: IndexPath(item: index, section: 0),
            at: .centeredHorizontally,
            animated: true)
        scrollCollectionView.isPagingEnabled = true
    }
}
