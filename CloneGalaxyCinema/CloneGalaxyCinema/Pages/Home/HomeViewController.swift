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
    // Get Content Flim Data
    var flimItems = FlimService.shared.getFlimDatas()
    private var flimNowItems: [FlimDataModel] = []
    private var flimCommingItems: [FlimDataModel] = []
    lazy var models = flimNowItems
    lazy var homeDatas = [FlimDataModel]()
    let address = ["Toàn quốc", "Đà Nẵng", "Đắk Lắk", "Nghệ An", "Khánh Hoà",
                   "Hải Phòng", "TP Hồ Chí Minh", "Hà Nội", "Bến Tre", "An Giang", "Cà Mau"]
    // Get Data Slide Header
    private let slideImageHeaderItems = FlimService.shared.getSlideHeaderDatas()
    // Get data Slide Footer
    private let slideFooterItems = FlimService.shared.getSlideFooterDatas()
    // Layout collectionView
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
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
        configureCollectionView()
        collectionViewRegisterCell()
        registerFooterHeaderSection()
        getItemsFlim()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isHiddenNavigation()
        addHomeDatas()
    }
    private func isHiddenNavigation() {
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = false
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
        homeCollectionView.register(HeaderContent.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                    withReuseIdentifier: HeaderContent.identifier)
        homeCollectionView.register(FooterConentView.self,
                                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                    withReuseIdentifier: FooterConentView.identifier)
    }
    private func getItemsFlim() {
        flimItems.forEach { item in
            if item.iscomming {
                if item.showHome {
                    flimNowItems.append(item)
                }
            } else {
                if item.showHome {
                    flimCommingItems.append(item)
                }
            }
        }
    }
    private func addHomeDatas() {
        flimItems.forEach { item in
            if item.showHome {
                homeDatas.append(item)
            }
        }
    }
}

// MARK: - Collection View Delegate, Datasource, Delegate Flow Layout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == numberSectionContent {
            if models.count >= 6 {
                return numberCellContent
            } else {
                return models.count
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
            cell.configure(data: models[indexPath.row])
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
                return CGSize(width: collectionView.frame.width, height: 280)
            }
        case numberSectionContent:
            var numberOfItemsPerRow: CGFloat = 0
            var padding: CGFloat = 0
            if UIDevice.current.userInterfaceIdiom == .pad {
                numberOfItemsPerRow = 4
                padding = 32 + 4 * 2
            } else {
                numberOfItemsPerRow = 2
                padding = 24
            }
            let width = collectionView.bounds.width
            let spacing: CGFloat = flowLayout.minimumInteritemSpacing
            let availableWidth = width - spacing * (numberOfItemsPerRow + 1) - padding * 2
            let itemDimension = floor(availableWidth / numberOfItemsPerRow)
            let height: CGFloat = 300
            return CGSize(width: itemDimension, height: height)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        flimItems[indexPath.row].showHome = !flimItems[indexPath.row].showHome
        let plainVC = PlainViewController()
        plainVC.flimItems = flimItems
        plainVC.idFlimClick = indexPath.row
        plainVC.headerIndex = currentHeaderIndex
        self.navigationController?.pushViewController(plainVC, animated: true)
    }
}

// MARK: - Push Screen Click See More
extension HomeViewController: ContentFooterDelegate {
    func didTabSeeMore() {
        let plainVC = PlainViewController()
        plainVC.flimItems = flimItems
        plainVC.headerIndex = currentHeaderIndex
        self.navigationController?.pushViewController(plainVC, animated: true)
    }
}
// MARK: - Content Header delegate
extension HomeViewController: ContentHeaderDelegate {

    func dialog() {
        let message = "\n\n\n\n\n\n"
        let alert = UIAlertController(title: "Vị trí hiện tại", message: message, preferredStyle: .actionSheet)
//        alert.isModalInPopover = true
        let pickerFrame = UIPickerView(frame: CGRect(x: 5, y: 20, width: view.frame.width - 20, height: 140))
        // CGRectMake(left, top, width, height) - left and top are like margins
        pickerFrame.tag = 555
        // set the pickers datasource and delegate
        pickerFrame.delegate = self
        pickerFrame.dataSource = self
        // Add the picker to the alert controller
        alert.view.addSubview(pickerFrame)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (_: UIAlertAction!) -> Void in
          // Perform Action
        })
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.parent!.present(alert, animated: true, completion: {  })
    }

    func changeDataNowContent(_ headerIndex: Int) {
        models = flimNowItems
        currentHeaderIndex = headerIndex
        homeCollectionView.reloadData()
    }

    func changeDataComContent(_ headerIndex: Int) {
        models = flimCommingItems
        currentHeaderIndex = headerIndex
        homeCollectionView.reloadData()
    }
}

extension HomeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return address[row]
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}
extension HomeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return address.count
    }
}
