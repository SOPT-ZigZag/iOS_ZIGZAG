//
//  StoreViewController.swift
//  ios_ZIGZAG
//
//  Created by Yi Joon Choi on 2021/05/17.
//

import UIKit

class StoreViewController: UIViewController {
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    let itemCollectionCellID = "shoppingCollectionViewCell"
    var storyList: [String] = []
    
    @IBOutlet weak var shoppingTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyCollectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        setStoryList()
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self

//        shoppingTableView.register(shoppingTableViewCell.nib(), forCellReuseIdentifier: "ShoppingTableViewCell")
//        shoppingTableView.delegate = self
//        shoppingTableView.dataSource = self
//
        self.navigationController?.navigationBar.isHidden = true
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        storyCollectionView.collectionViewLayout = layout
        

    }
    
    func setStoryList()
    {
        storyList.append(contentsOf: [
            "component40", "component41", "component30", "component30",
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

extension StoreViewController: UICollectionViewDelegateFlowLayout
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
        return 8
    }
    
    // minimumInteritemSpacing 메서드: Cell 들의 좌,우 간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return categories.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
//
//
//        return cell
//    }
}

