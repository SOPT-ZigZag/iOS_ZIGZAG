//
//  BrandViewController.swift
//  ios_ZIGZAG
//
//  Created by Yi Joon Choi on 2021/05/17.
//

import UIKit

class BrandViewController: UIViewController {
    

    @IBOutlet weak var itemCollection: UICollectionView!
    
    let itemCollectionCellID = "ItemCollectionViewCell"
    
    var items = [ItemDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemCollection.delegate = self
        itemCollection.dataSource = self

        // Do any additional setup after loading the view.
        let nibCell = UINib(nibName: itemCollectionCellID, bundle: nil)
        itemCollection.register(nibCell, forCellWithReuseIdentifier: itemCollectionCellID)

        
        setItemList()
    
    
    }
    
    func setItemList(){
        
        items.append(contentsOf: [ItemDataModel(name: "인텐스", itemDes: "설명1", price: 35900, discount: false, percent: 0, itemImageName: "rectangle52", freeDelivery: true, fastDelivery: false),
        
                                  ItemDataModel(name: "인텐스", itemDes: "설명2", price: 129000, discount: true, percent: 72, itemImageName: "rectangle54", freeDelivery: true, fastDelivery: false),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "설명3", price: 129000, discount: true, percent: 72, itemImageName: "rectangle53", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "설명3", price: 129000, discount: true, percent: 72, itemImageName: "rectangle53", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "설명3", price: 129000, discount: true, percent: 72, itemImageName: "rectangle53", freeDelivery: true, fastDelivery: true)
        ])
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BrandViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let itemCell = itemCollection.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)as? ItemCollectionViewCell else {return UICollectionViewCell()}
        
        
        itemCell.setData(name: items[indexPath.row].name, itemDes: items[indexPath.row].itemDes, discount: items[indexPath.row].discount, percent: items[indexPath.row].percent, price: items[indexPath.row].percent, itemImageName: items[indexPath.row].itemImageName, freeDelivery: items[indexPath.row].freeDelivery, fastDelivery: items[indexPath.row].fastDelivery)
        
        return itemCell
    
    }
    
    
    
    
}

extension BrandViewController: UICollectionViewDelegate {
    
}

extension BrandViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width

        let cellWidth = width * (111/375)
        let cellHeight = cellWidth * (221/111)
                
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    

    
}

