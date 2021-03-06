//
//  StoreViewController.swift
//  ios_ZIGZAG
//
//  Created by Yi Joon Choi on 2021/05/17.
//

import UIKit

class StoreViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    let itemCollectionCellID = "storyCollectionViewCell"
    var storyList: [String] = []
    
    @IBOutlet weak var shoppingTableView: UITableView!
    let itemTableCellID = "shoppingTableViewCell"
    var shoppingList: [ShoppingDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyCollectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        setStoryList()
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self

        self.navigationController?.navigationBar.isHidden = true
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        storyCollectionView.collectionViewLayout = layout
        
        setItemList()
        shoppingTableView.register(ShoppingTableViewCell.nib(), forCellReuseIdentifier: "ShoppingTableViewCell")
        shoppingTableView.delegate = self
        shoppingTableView.dataSource = self
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 27))
        let footer = UIImageView(frame: CGRect(x: 0, y: 15, width: view.frame.size.width, height: 40))
        
        let rankingImage = UIImage(named: "btnMore")
        footer.image = rankingImage
        footer.contentMode = .scaleAspectFit
        
        shoppingTableView.tableHeaderView = header
        shoppingTableView.tableFooterView = footer
    }
    
    func setStoryList()
    {
        storyList.append(contentsOf: [
            "component40", "component41", "component30", "component30",
        ])
    }
    
    func setItemList()
    {
        shoppingList.append(contentsOf: [
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse19", maintitle: "????????????", subtitle: "???????????????, ?????????", cupontitle: "?????? 1,000??? ??????", ranktitle: "-", likepeople: "194.5???", color: UIColor.lightGray),
            ShoppingDataModel(shopnumber: "2", shopimagename: "ellipse20", maintitle: "???????????????", subtitle: "???????????????, ?????????", cupontitle: "?????? 1,000??? ??????", ranktitle: "+1", likepeople: "194.5???", color: UIColor.systemPink),
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse21", maintitle: "??????", subtitle: "???????????????, ?????????", cupontitle: "?????? 1,000??? ??????", ranktitle: "-1", likepeople: "194.5???", color: UIColor.blue),
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse22", maintitle: "????????????", subtitle: "???????????????, ?????????", cupontitle: "?????? 1,000??? ??????", ranktitle: "-", likepeople: "194.5???", color: UIColor.lightGray),
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse23", maintitle: "?????????", subtitle: "???????????????, ?????????", cupontitle: "?????? 1,000??? ??????", ranktitle: "-", likepeople: "194.5???", color: UIColor.lightGray)
        ])
        
    }
    
}


extension StoreViewController: UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let storyCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else {return UICollectionViewCell()}
        
        storyCell.storyImageView.image = UIImage(named: storyList[indexPath.row])
        
        return storyCell
    }
    
}

extension StoreViewController: UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = StoryViewController()
        nextVC.modalPresentationStyle = .overFullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}

extension StoreViewController: UICollectionViewDelegateFlowLayout, UITableViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width      // ?????? ???????????? ????????? width??? ???????????? ??????
        
        let cellWidth = width * (109/375)            // ?????????????????? ???????????? ????????? width??? ??????
        let cellHeight = cellWidth * (195/109)        // ?????????????????? ???????????? ????????? height??? ??????
        
        return CGSize(width: cellWidth, height: cellHeight)     // ????????? ??????/????????? CGSize????????? return
    }
    
    // ContentInset ?????????: Cell?????? Content ????????? ???????????? Inset??? ????????? ??????
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero    //  Inset??? ???????????? ???????????? ???
    }
    
    // minimumLineSpacing ?????????: Cell ?????? ???, ?????? ?????? ??????
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    // minimumInteritemSpacing ?????????: Cell ?????? ???,??? ?????? ??????
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shoppingCell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier, for: indexPath) as? ShoppingTableViewCell else {return UITableViewCell() }
        
        shoppingCell.setData(number: shoppingList[indexPath.row].shopnumber, imageName: shoppingList[indexPath.row].shopimagename, mainShop: shoppingList[indexPath.row].maintitle, subShop: shoppingList[indexPath.row].subtitle, dc: shoppingList[indexPath.row].cupontitle, ranked: shoppingList[indexPath.row].ranktitle, like: shoppingList[indexPath.row].likepeople)
        
        shoppingCell.rankLabel.textColor = shoppingList[indexPath.row].color
        
        return shoppingCell
    }
}

