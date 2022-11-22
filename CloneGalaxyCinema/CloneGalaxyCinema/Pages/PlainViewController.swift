//
//  PlainViewController.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 21/11/2022.
//

import UIKit

class PlainViewController: UIViewController {
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
                                     name: "One Piece Film Red"),
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
    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var contentView: ContentHeader!
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = true
        title = "Plain"
        contentView.delegate = self
        configureCollectionView()
    }
    private func configureCollectionView() {
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        contentCollectionView.register(ContentCell.nib(), forCellWithReuseIdentifier: ContentCell.identifier)
    }
}
extension PlainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelContent.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ContentCell.identifier,
            for: indexPath) as? ContentCell else {
            fatalError()
        }
        cell.configure(data: model[indexPath.row])
        return cell
    }
}
extension PlainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        let numberOfItemsPerRow: CGFloat = 2
        let spacing: CGFloat = flowLayout.minimumInteritemSpacing
        let availableWidth = width - spacing * (numberOfItemsPerRow + 1)
        let itemDimension = floor(availableWidth / numberOfItemsPerRow)
        return CGSize(width: itemDimension, height: 300)
    }

}

extension PlainViewController: UICollectionViewDelegate {

}

extension PlainViewController: ContentHeaderDelegate {
    func changeDataNowContent() {
        model = modelContent
        contentCollectionView.reloadData()
    }
    func changeDataComContent() {
        model = modelContent2
        contentCollectionView.reloadData()
    }
    func dialog(_ view: UIView) {
        print("321")
    }
}
