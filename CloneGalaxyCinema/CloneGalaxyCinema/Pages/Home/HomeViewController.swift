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

class HomeViewController: UIViewController {
    @IBOutlet weak var homeCollectionView: UICollectionView!
    let getData = InsertData()
    lazy var model = getData.insertDataFlimNow()
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return layout
    }()
    var currentcellIndext = 0
    lazy var currentHeaderIndex = 0
    var time: Timer?

    let numberOfSection = 3

    let numberSectionHeader = 0
    let numberSectionContent = 1
    let numberSectionFooter = 2

    let numberCellContent = 6

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        collectionViewRegisterCell()
        registerFooterHeader()
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
    private func registerFooterHeader() {
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
            return numberCellContent
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
            cell.scrollImage = getData.inserDataSliderHeader()
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
            cell.footerData = getData.insertDataSliderFooter()
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
            return CGSize(width: collectionView.frame.width, height: view.bounds.height/2.5)
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == numberSectionHeader {
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: ScrollFooter.identifier,
                for: indexPath) as? ScrollFooter else {
                fatalError()
            }
            footer.pageControl.numberOfPages = getData.inserDataSliderHeader().count
            footer.currentSlideIndex = getData.inserDataSliderHeader().count
            footer.delegate = self
            return footer
        } else {
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
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == numberSectionHeader {
            return CGSize(width: collectionView.frame.width, height: 30)
        } else if section == numberSectionContent {
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
        model = getData.insertDataFlimNow()
        currentHeaderIndex = headerIndex
        homeCollectionView.reloadData()
    }

    func changeDataComContent(_ headerIndex: Int) {
        model = getData.insertDataFlimComing()
        currentHeaderIndex = headerIndex
        homeCollectionView.reloadData()
    }

}

extension HomeViewController: HeaderScrollFooterDelegate {
    func slideToNext(_ index: Int) {
    }
}
