//
//  ItemCollectionViewCell.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/05/18.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier : String = "ItemCollectionViewCell"


    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var discLabel: UILabel!
    @IBOutlet weak var originalPrice: UILabel!
    @IBOutlet weak var discPercent: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var freeDeliv: UILabel!
    @IBOutlet weak var fastDeliv: UILabel!
    
    
    @IBOutlet weak var discountView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(name: String, itemDes: String, discount: Bool, percent : Int, price: Int, itemImageName: String, freeDelivery: Bool, fastDelivery: Bool ) {
       
        //default setting
        itemName.text = name
        itemDesc.text = itemDes
        
        if let image = UIImage(named: itemImageName) {
            itemImage.image = image
        }
        
        //if item is not on discount
        if discount == false {
            discLabel.isHidden = true
            discPercent.isHidden = true
            originalPrice.isHidden = true
            discountView.isHidden = true
            //set price to the original price
            itemPrice.text = String(price)
        } else {
            itemPrice.text = String(Double(percent) * 0.01 * Double(price))
            discPercent.text = String(percent) //add percent sign 
        }
        
        //if it's not free delivery item
        if freeDelivery == false {
            freeDeliv.isHidden = true
        }
        
        if fastDelivery == false {
            fastDeliv.isHidden = true
        }
        
    }
    

}
