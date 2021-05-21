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
    @IBOutlet weak var freeDeliv: UIImageView!
    @IBOutlet weak var fastDeliv: UIImageView!
    @IBOutlet weak var discountView: UIView!
    
    @IBOutlet weak var heartButton: UIButton!
    
    @IBAction func heartClicked(_ sender: Any) {
        let blankHeart = UIImage(named:"icLike")
        
        
        if (heartButton.currentImage == blankHeart) {
        heartButton.setImage(UIImage(named: "icLikeClicked"), for: UIControl.State.normal)
        } else {
            heartButton.setImage(blankHeart, for: UIControl.State.normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    
    
    func setData(name: String, itemDes: String, price: Int, discount : Bool, discountPrice: Int, percent: Int, itemImageName: String, freeDelivery: Bool, fastDelivery: Bool ) {
       
        //default setting
        itemName.text = name
        itemDesc.text = itemDes
        heartButton.isHidden = false 
        
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
            itemPrice.text = String(discountPrice) //calculate discount price
            discPercent.text = String(percent) + "%"//add percent sign
            
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
