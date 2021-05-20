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
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse19", maintitle: "육육걸즈", subtitle: "심플베이직, 러블리", cupontitle: "최대 1,000원 쿠폰", ranktitle: "-", likepeople: "194.5만", color: UIColor.lightGray),
            ShoppingDataModel(shopnumber: "2", shopimagename: "ellipse20", maintitle: "슬로우엔드", subtitle: "심플베이직, 러블리", cupontitle: "최대 1,000원 쿠폰", ranktitle: "+1", likepeople: "194.5만", color: UIColor.systemPink),
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse21", maintitle: "핫핑", subtitle: "심플베이직, 러블리", cupontitle: "최대 1,000원 쿠폰", ranktitle: "-1", likepeople: "194.5만", color: UIColor.blue),
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse22", maintitle: "아름다운", subtitle: "심플베이직, 러블리", cupontitle: "최대 1,000원 쿠폰", ranktitle: "-", likepeople: "194.5만", color: UIColor.lightGray),
            ShoppingDataModel(shopnumber: "1", shopimagename: "ellipse23", maintitle: "고고씽", subtitle: "심플베이직, 러블리", cupontitle: "최대 1,000원 쿠폰", ranktitle: "-", likepeople: "194.5만", color: UIColor.lightGray)
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
    
}

extension StoreViewController: UICollectionViewDelegateFlowLayout, UITableViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width      // 현재 사용하는 기기의 width를 가져와서 저장
        
        let cellWidth = width * (109/375)            // 제플린에서의 비율만큼 곱해서 width를 결정
        let cellHeight = cellWidth * (195/109)        // 제플린에서의 비율만큼 곱해서 height를 결정
        
        return CGSize(width: cellWidth, height: cellHeight)     // 정해진 가로/세로를 CGSize형으로 return
    }
    
    // ContentInset 메서드: Cell에서 Content 외부에 존재하는 Inset의 크기를 결정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero    //  Inset을 사용하지 않는다는 뜻
    }
    
    // minimumLineSpacing 메서드: Cell 들의 위, 아래 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7
    }
    
    // minimumInteritemSpacing 메서드: Cell 들의 좌,우 간격 지정
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

