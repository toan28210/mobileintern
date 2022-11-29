//
//  HomeViewController.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 11/11/2022.
//

import UIKit

enum UIUserInterfaceIdiom: Int {
    case phone
    case pad
}
enum Section: Int {
    case header = 0
    case main = 1
    case footer = 2
}

class HomeViewController: UIViewController {
    @IBOutlet weak var homeCollectionView: UICollectionView!
    // Get Content Flim Data
    private let flimItems = Bundle.main.decode(
        type: [FlimDataModel].self,
        from: "DummyDataFlimJSON.json")
    private var flimNowItems: [FlimDataModel] = []
    private var flimCommingItems: [FlimDataModel] = []
    lazy var model = flimNowItems

    // Get Data Slide Header
    private let slideImageHeaderItems = Bundle.main.decode(
        type: [SlideHeaderDataModel].self,
        from: "DummyDataSlideHeaderJSON.json")
    // Get data Slide Footer
    private let slideFooterItems = Bundle.main.decode(
        type: [SlideFooterDataModel].self,
        from: "DummyDataSlideFooterJSON.json")
    // Layout collectionView
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }()
    // pageControl
    var currentcellIndext = 0
    lazy var currentHeaderIndex = 0

    let numberOfSection = 3

    // Section
    let numberSectionHeader = 0
    let numberSectionContent = 1
    let numberSectionFooter = 2

    let numberCellContent = 6

    override func viewDidLoad() {
        super.viewDidLoad()
        getItemsFlim()
        configureCollectionView()
        collectionViewRegisterCell()
        registerFooterHeaderSection()
    }
    private func getItemsFlim() {
        flimItems.forEach { item in
            if item.iscomming {
                flimNowItems.append(item)
            } else {
                flimCommingItems.append(item)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isHiddenNavigation()
    }
    private func isHiddenNavigation() {
        self.navigationController?.isNavigationBarHidden = true
    }

    private func configureCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    private func collectionViewRegisterCell() {
        homeCollectionView.register(ScrollCollectionViewCell.nib(),
                                    forCellWithReuseIdentifier: ScrollCollectionViewCell.identifier)
        homeCollectionView.register(ContentCell.nib(),
                                    forCellWithReuseIdentifier: ContentCell.identifier)
        homeCollectionView.register(FooterScrollCell.nib(),
                                    forCellWithReuseIdentifier: FooterScrollCell.identifier)
    }
    private func registerFooterHeaderSection() {
        homeCollectionView.register(ScrollFooter.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                    withReuseIdentifier: ScrollFooter.identifier)
        homeCollectionView.register(HeaderContent.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: HeaderContent.identifier)
        homeCollectionView.register(FooterConentView.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                    withReuseIdentifier: FooterConentView.identifier)
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == numberSectionContent {
            if model.count >= 6 {
                return numberCellContent
            } else {
                return model.count
            }
        } else {
            return 1
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numberOfSection
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == numberSectionHeader {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ScrollCollectionViewCell.identifier,
                for: indexPath) as? ScrollCollectionViewCell else {
                fatalError()
            }
            cell.items = slideImageHeaderItems
            cell.backgroundColor = .red
            return cell
        } else if indexPath.section == numberSectionContent {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentCell.identifier,
                for: indexPath) as? ContentCell else {
                fatalError()
            }
            cell.configure(data: model[indexPath.row])
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FooterScrollCell.identifier,
                for: indexPath) as? FooterScrollCell else {
                fatalError()
            }
            cell.footerItems = slideFooterItems
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case numberSectionHeader:
            if UIDevice.current.userInterfaceIdiom == .pad {
                return CGSize(width: collectionView.frame.width, height: view.bounds.height/2.5)
            } else {
                return CGSize(width: collectionView.frame.width, height: 260)
            }
        case numberSectionContent:
            if UIDevice.current.userInterfaceIdiom == .pad {
                let width = collectionView.bounds.width
                let numberOfItemsPerRow: CGFloat = 4
                let spacing: CGFloat = flowLayout.minimumInteritemSpacing
                let padding: CGFloat = 20
                let availableWidth = width - spacing * (numberOfItemsPerRow + 1) - padding * 2
                let itemDimension = floor(availableWidth / numberOfItemsPerRow)
                let height: CGFloat = 300
                return CGSize(width: itemDimension, height: height)
            } else {
                let width = collectionView.bounds.width
                let numberOfItemsPerRow: CGFloat = 2
                let spacing: CGFloat = flowLayout.minimumInteritemSpacing
                let padding: CGFloat = 20
                let availableWidth = width - spacing * (numberOfItemsPerRow + 1) - padding
                let itemDimension = floor(availableWidth / numberOfItemsPerRow)
                let height: CGFloat = 300
                return CGSize(width: itemDimension, height: height)
            }
        default:
            return CGSize(width: collectionView.frame.width, height: 300)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: HeaderContent.identifier,
                    for: indexPath) as? HeaderContent else {
                    fatalError()
                }
                header.contentView.delegate = self
                return header
            } else {
                guard let footer = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: FooterConentView.identifier,
                    for: indexPath) as? FooterConentView else {
                    fatalError()
                }
                footer.superView.delegate = self
                return footer
            }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == numberSectionContent {
            return CGSize(width: collectionView.frame.width, height: 100)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == numberSectionContent {
            return CGSize(width: collectionView.frame.width, height: 50)
        } else {return CGSize(width: 0, height: 0)}
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return flowLayout.sectionInset
        } else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension HomeViewController: ContentFooterDelegate {
    func didTabSeeMore() {
        let plainVC = PlainViewController()
        plainVC.model = model
        plainVC.headerIndex = currentHeaderIndex
        self.navigationController?.pushViewController(plainVC, animated: true)
    }
}
extension HomeViewController: ContentHeaderDelegate {

    func dialog(_ view: UIView) {
        print("123")
    }

    func changeDataNowContent(_ headerIndex: Int) {
        model = flimNowItems
        currentHeaderIndex = headerIndex
        homeCollectionView.reloadData()
    }

    func changeDataComContent(_ headerIndex: Int) {
        model = flimCommingItems
        currentHeaderIndex = headerIndex
        homeCollectionView.reloadData()
    }

}

extension HomeViewController: HeaderScrollFooterDelegate {
    func slideToNext(_ index: Int) {
    }
}
