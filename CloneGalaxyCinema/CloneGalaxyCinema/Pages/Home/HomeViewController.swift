//
//  HomeViewController.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 11/11/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeCollectionView: UICollectionView!
    let modelContent = [ContentData(image: "blackpanther",
                                    star: "8.9",
                                    limitAge: "C",
                                    name: "Chiến binh báo đen: Wankanda bất diệt"),
                        ContentData(image: "blackpanther",
                                    star: "8.9",
                                    limitAge: "C",
                                    name: "Chiến binh báo đen: Wankanda bất diệt"),
                        ContentData(image: "blackpanther",
                                    star: "8.9",
                                    limitAge: "C",
                                    name: "Chiến binh báo đen: Wankanda bất diệt"),
                        ContentData(image: "blackpanther",
                                    star: "8.9",
                                    limitAge: "C",
                                    name: "Chiến binh báo đen: Wankanda bất diệt"),
                        ContentData(image: "blackpanther",
                                    star: "8.9",
                                    limitAge: "C",
                                    name: "Chiến binh báo đen: Wankanda bất diệt"),
                        ContentData(image: "blackpanther",
                                    star: "8.9",
                                    limitAge: "C",
                                    name: "Chiến binh báo đen: Wankanda bất diệt")
    ]

    let modelContent2 = [ContentData(image: "anh",
                                     star: "8.9",
                                     limitAge: "C",
                                     name: "Chiến binh báo đen: Wankanda bất diệt"),
                         ContentData(image: "anh",
                                     star: "8.9",
                                     limitAge: "C",
                                     name: "Chiến binh báo đen: Wankanda bất diệt"),
                         ContentData(image: "anh",
                                     star: "8.9",
                                     limitAge: "C",
                                     name: "Chiến binh báo đen: Wankanda bất diệt"),
                         ContentData(image: "blackpanther",
                                     star: "8.9",
                                     limitAge: "C",
                                     name: "Chiến binh báo đen: Wankanda bất diệt"),
                         ContentData(image: "blackpanther",
                                     star: "8.9",
                                     limitAge: "C",
                                     name: "Chiến binh báo đen: Wankanda bất diệt"),
                         ContentData(image: "blackpanther",
                                     star: "8.9",
                                     limitAge: "C",
                                     name: "Chiến binh báo đen: Wankanda bất diệt")
    ]
    lazy var model = modelContent

    var modelFooter = [FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao"),
                       FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao"),
                       FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao"),
                       FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao"),
                       FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao"),
                       FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao"),
                       FooterScrollData(image: "anh", title: "ZaloPay Mùa Nào Cũng Khao")]

    let collectionView = ScrollCollectionViewCell()
    var currentcellIndext = 0
    var currentHeaderIndex = 0
    var currentNumber = ScrollFooter()
    var time: Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        time = Timer.scheduledTimer(timeInterval: 2.0,
                                    target: self,
                                    selector: #selector(slideTonext),
                                    userInfo: nil,
                                    repeats: true)
    }

    private func configureCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        collectionViewRegister()
    }
    private func collectionViewRegister() {
        homeCollectionView.register(ScrollCollectionViewCell.nib(),
                                    forCellWithReuseIdentifier: ScrollCollectionViewCell.identifier)
        homeCollectionView.register(ContentCollectionViewCell.nib(),
                                    forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
        homeCollectionView.register(FooterScrollCell.nib(),
                                    forCellWithReuseIdentifier: FooterScrollCell.identifier)
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
    @objc func slideTonext() {
        if currentcellIndext < ScrollCollectionViewCell.scrollImage.count - 1 {
            currentcellIndext += 1
        } else {
            currentcellIndext = 0
        }
        currentNumber.currentPage(num: currentcellIndext)
        //        if let scrollCollectionView = collectionView.scrollCollectionView {
        //            print("123")
        //            scrollCollectionView.isPagingEnabled = false
        //            scrollCollectionView.scrollToItem(at: IndexPath(item: currentcellIndext, section: 0),
        //                                              at: .centeredHorizontally , animated: true)
        //            scrollCollectionView.isPagingEnabled = true
        //        }
    }
    @objc func rightSwiped() {
        print("right")
    }
    @objc func leftSwiped() {
        print("left")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ScrollCollectionViewCell.identifier,
                for: indexPath) as? ScrollCollectionViewCell else {
                fatalError()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ContentCollectionViewCell.identifier,
                for: indexPath) as? ContentCollectionViewCell else {
                fatalError()
            }
            cell.filmModel = model
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: FooterScrollCell.identifier,
                for: indexPath) as? FooterScrollCell else {
                fatalError()
            }
            cell.footerData = modelFooter
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 200)
        case 1:
            return CGSize(width: collectionView.frame.width, height: 950)
        default:
            return CGSize(width: collectionView.frame.width, height: 300)
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            guard let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: ScrollFooter.identifier,
                for: indexPath) as? ScrollFooter else {
                fatalError()
            }
            footer.pageControl.numberOfPages = ScrollCollectionViewCell.scrollImage.count
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
                let contentView = ContentFooter()
                contentView.delegate = self
                return footer
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.frame.width, height: 50)
        } else if section == 1 {
            return CGSize(width: collectionView.frame.width, height: 50)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return CGSize(width: collectionView.frame.width, height: 50)
        } else {return CGSize(width: 0, height: 0)}
    }
}

extension HomeViewController: ContentFooterDelegate {
    func didTabSeeMore(_ button: UIButton) {
    }
}
extension HomeViewController: ContentHeaderDelegate {
    func dialog(_ view: UIView) {
        print("123")
    }
    func changeDataNowContent() {
        model = modelContent
        let contentCollectionView = ContentCollectionViewCell()
        contentCollectionView.contentCollectionView.reloadData()
    }

    func changeDataComContent() {
        model = modelContent2
        let contentCollectionView = ContentCollectionViewCell()
        contentCollectionView.contentCollectionView.reloadData()
    }

}
