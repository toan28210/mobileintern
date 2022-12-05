//
//  PlainViewController.swift
//  CloneGalaxyCinema
//
//  Created by Toan Tran on 21/11/2022.
//

import UIKit

class PlainViewController: UIViewController {
    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var contentView: ContentHeader!
    lazy var flimItems = [FlimDataModel]()
    private var flimNowItems: [FlimDataModel] = []
    private var flimCommingItems: [FlimDataModel] = []
    lazy var models: [FlimDataModel] = []
    lazy var idFlimClick = 0

    // Index Update UI Header Section
    lazy var headerIndex: Int = 0

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
        configureButton()
        getItemsFlim()
        getItemModels()
    }
    private func getItemModels() {
        if headerIndex == 0 {
            models = flimNowItems
        } else {
            models = flimCommingItems
        }
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

    private func configureCollectionView() {
        contentCollectionView.delegate = self
        contentCollectionView.dataSource = self
        contentCollectionView.register(ContentCell.nib(), forCellWithReuseIdentifier: ContentCell.identifier)
    }
    private func configureButton() {
        contentView.headerIndex = self.headerIndex
        contentView.updateButtonUI()
    }
}
extension PlainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ContentCell.identifier,
            for: indexPath) as? ContentCell else {
            fatalError()
        }
        cell.configure(data: models[indexPath.row])
        cell.radioButton.isHidden = false
        cell.delegate = self
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
    func changeDataNowContent(_ headerIndex: Int) {
        models = flimNowItems
        self.headerIndex = headerIndex
        contentCollectionView.reloadData()
    }
    func changeDataComContent(_ headerIndex: Int) {
        models = flimCommingItems
        self.headerIndex = headerIndex
        contentCollectionView.reloadData()
    }
    func dialog() {
        print("321")
    }
}

// MARK: - Content Cell Delegate Click Radio Button
extension PlainViewController: ContentCellDelegate {
    func test(_ id: Int) {
        var count = 0
        flimItems.forEach { item in
            if item.id == id {
                flimItems[count].showHome = true
                let thisItem = flimItems[count]
                flimItems[count] = flimItems[idFlimClick]
                flimItems[idFlimClick] = thisItem
                let home = HomeViewController()
                home.flimItems = flimItems
                self.navigationController?.pushViewController(home, animated: false)
            }
            count += 1
        }
    }
}
