//
//  BrandViewController.swift
//  ios_ZIGZAG
//
//  Created by Yi Joon Choi on 2021/05/17.
//

import UIKit

class BrandViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var itemTableView: UITableView!
    @IBOutlet weak var itemCollection: UICollectionView!
    @IBOutlet weak var SecondItemCollection: UICollectionView!
    @IBOutlet weak var ThirdItemCollection: UICollectionView!
    @IBOutlet weak var banner: UIImageView!
    
    let itemTableCellID = "ItemTableViewCell"
    let itemCollectionCellID = "ItemCollectionViewCell"
    let SecondItemCollectionCellID = "SecondItemCollectionViewCell"
    let ThirdItemCollectionCellID = "ThirdItemCollectionViewCell"

    
    var items = [ItemDataModel]()
    var itemsTable : [ItemDataModel] = []
    var secondItems = [ItemDataModel]()
    var thirdItems = [ItemDataModel]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //아직 랜덤은 구현
        GetBannerDataService.shared.getBannerInfo { [self] (response) in
            switch (response) {
            case .success(let bannerData):
                if let data = bannerData as? Banner {
                    
                    
                    let url = URL(string: data.img)
                    
                    do {
                    let image = try Data(contentsOf: url!)
                        self.banner.image = UIImage(data: image)
                        
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                    
                }
            case .requestErr(let message):
                print("requestERR", message)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }

        
        setTableList()
        setItemList()
        setSecondItemsList()
        setThirdItemsList()
        
      
        itemTableView.register(ItemTableViewCell.nib(), forCellReuseIdentifier: "ItemTableViewCell")
        itemTableView.delegate = self
        itemTableView.dataSource = self
        itemTableView.separatorStyle = .none
        
        itemCollection.delegate = self
        itemCollection.dataSource = self
       
        SecondItemCollection.delegate = self
        SecondItemCollection.dataSource = self
        
        ThirdItemCollection.delegate = self
        ThirdItemCollection.dataSource = self
      
        let nibCell = UINib(nibName: itemCollectionCellID, bundle: nil)
        itemCollection.register(nibCell, forCellWithReuseIdentifier: itemCollectionCellID)
        
        let secondCell = UINib(nibName: SecondItemCollectionCellID, bundle: nil)
        SecondItemCollection.register(secondCell, forCellWithReuseIdentifier: SecondItemCollectionCellID)
        
        let thirdCell = UINib(nibName: ThirdItemCollectionCellID, bundle: nil)
        ThirdItemCollection.register(thirdCell, forCellWithReuseIdentifier: ThirdItemCollectionCellID)
        
        

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        
        itemCollection.collectionViewLayout = layout
        
        let secondLayout = UICollectionViewFlowLayout()
        secondLayout.scrollDirection = .horizontal
        SecondItemCollection.collectionViewLayout = secondLayout
        
        let thirdLayout = UICollectionViewFlowLayout()
        ThirdItemCollection.collectionViewLayout = thirdLayout
        
    }
    
    
  func setTableList(){
    
    var brandName = ""
    GetItemDataService.shared.getItemInfo { [self] (response) in
        
        switch (response) {
        case .success(let itemData):
            if let data = itemData as? Items {
                
                print(brandName)
                print("성공")
                
                
                /*
                self.itemsTable.append(contentsOf: [
                                    
                    ItemDataModel(name: "인텐스", itemDes: "[모델소장, 기획특가]베이브 탄탄 여리넥하프ㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "table1", freeDelivery: true, fastDelivery: false),
                    
                    ItemDataModel(name: "인텐스", itemDes: "[모델소장, 기획특가]베이브 탄탄 여리넥하프ㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "table2", freeDelivery: false, fastDelivery: false),
                    
                    ItemDataModel(name: "인텐스", itemDes: "[모델소장, 기획특가]베이브 탄탄 여리넥하프ㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "table3", freeDelivery: true, fastDelivery: true)])
 
 */
        
            }
            
            //print("오잉")
            
            
            
            case .requestErr(let message):
                print("requestERR", message)
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
    }
      
    
        print(brandName)
        self.itemsTable.append(contentsOf: [
                                  ItemDataModel(name: brandName, itemDes: "[모델소장, 기획특가]베이브 탄탄 여리넥하프ㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "table1", freeDelivery: true, fastDelivery: false),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[모델소장, 기획특가]베이브 탄탄 여리넥하프ㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "table2", freeDelivery: false, fastDelivery: false),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[모델소장, 기획특가]베이브 탄탄 여리넥하프ㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "table3", freeDelivery: true, fastDelivery: true)
                                  
        ])
 
    }
 
    func setItemList(){
        
        items.append(contentsOf: [ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 35900, discount: false, discountPrice: 0,percent: 0, itemImageName: "collec1", freeDelivery: true, fastDelivery: false),
        
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "collec2", freeDelivery: true, fastDelivery: false),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "collec3", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "collec1", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "collec2", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "collec3", freeDelivery: true, fastDelivery: true)
        ])
    }

    func setSecondItemsList() {
        secondItems.append(contentsOf: [ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 35900, discount: false, discountPrice: 0,percent: 0, itemImageName: "second1", freeDelivery: true, fastDelivery: false),
        
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "second2", freeDelivery: true, fastDelivery: false),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "second3", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "second1", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "second2", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "second3", freeDelivery: true, fastDelivery: true)
        ])
        
    }
    
    
    func setThirdItemsList() {
        thirdItems.append(contentsOf: [ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 35900, discount: false, discountPrice: 0,percent: 0, itemImageName: "three1", freeDelivery: true, fastDelivery: false),
        
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "three2", freeDelivery: true, fastDelivery: false),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true, discountPrice: 39000, percent: 72, itemImageName: "three3", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "three4", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "three5", freeDelivery: true, fastDelivery: true),
                                  
                                  ItemDataModel(name: "인텐스", itemDes: "[셈디,미희 착용] 엘칸ㅇㅇㅇㅇ", price: 129000, discount: true,discountPrice: 39000, percent: 72, itemImageName: "three6", freeDelivery: true, fastDelivery: true)
        
                                  
        ])
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //}
    

}

extension BrandViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 79
       }
}

extension BrandViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.itemCollection {
        return items.count
        }else if collectionView == self.SecondItemCollection {
            return secondItems.count
        }
        else {
            return thirdItems.count
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let itemCell = itemCollection.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath)as? ItemCollectionViewCell else {return UICollectionViewCell()}
        
        
        itemCell.setData(name: items[indexPath.row].name, itemDes: items[indexPath.row].itemDes, price: items[indexPath.row].price, discount: items[indexPath.row].discount,discountPrice:  items[indexPath.row].discountPrice, percent: items[indexPath.row].percent, itemImageName: items[indexPath.row].itemImageName, freeDelivery: items[indexPath.row].freeDelivery, fastDelivery: items[indexPath.row].fastDelivery)
        
        guard let SecondItemCell = SecondItemCollection.dequeueReusableCell(withReuseIdentifier: "SecondItemCollectionViewCell", for: indexPath)as? SecondItemCollectionViewCell else {return UICollectionViewCell()}
        
        
        SecondItemCell.setData(name: secondItems[indexPath.row].name, itemDes: secondItems[indexPath.row].itemDes, price: secondItems[indexPath.row].price, discount: secondItems[indexPath.row].discount,discountPrice:  secondItems[indexPath.row].discountPrice, percent: secondItems[indexPath.row].percent, itemImageName: secondItems[indexPath.row].itemImageName, freeDelivery: secondItems[indexPath.row].freeDelivery, fastDelivery: secondItems[indexPath.row].fastDelivery)
        
        guard let thirdItemCell = ThirdItemCollection.dequeueReusableCell(withReuseIdentifier: "ThirdItemCollectionViewCell", for: indexPath)as? ThirdItemCollectionViewCell else {return UICollectionViewCell()}
        
        
        thirdItemCell.setData(name: thirdItems[indexPath.row].name, itemDes: thirdItems[indexPath.row].itemDes, price: thirdItems[indexPath.row].price, discount: thirdItems[indexPath.row].discount,discountPrice:  thirdItems[indexPath.row].discountPrice, percent: thirdItems[indexPath.row].percent, itemImageName: thirdItems[indexPath.row].itemImageName, freeDelivery: thirdItems[indexPath.row].freeDelivery, fastDelivery: thirdItems[indexPath.row].fastDelivery)
        
        if collectionView == self.itemCollection {
       
        
            return itemCell
            
        } else if collectionView == self.SecondItemCollection {
           
        
            return SecondItemCell
        } else {
            return thirdItemCell

        }
    }
}

extension BrandViewController: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = UIScreen.main.bounds.width

        if (collectionView == self.itemCollection) {

            let cellWidth = width * (110/375)
        
            return CGSize(width: cellWidth, height: 218)
            
        } else if (collectionView == self.SecondItemCollection) {
            let cellWidth = width * (105/375)

            return CGSize(width: cellWidth, height: 214)
        }
        
        else {
            let cellWidth = width * (160/375)
            return CGSize(width: cellWidth, height: 274)

        }
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
extension BrandViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsTable.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let itemTableCell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath)as? ItemTableViewCell else {return UITableViewCell() }
               
        itemTableCell.setData(name: itemsTable[indexPath.row].name, itemDes: itemsTable[indexPath.row].itemDes, price: itemsTable[indexPath.row].price, discount: itemsTable[indexPath.row].discount,discountPrice:  itemsTable[indexPath.row].discountPrice, percent: itemsTable[indexPath.row].percent, itemImageName: itemsTable[indexPath.row].itemImageName, freeDelivery: itemsTable[indexPath.row].freeDelivery, fastDelivery: itemsTable[indexPath.row].fastDelivery)
               
            return itemTableCell
        
    }

}
