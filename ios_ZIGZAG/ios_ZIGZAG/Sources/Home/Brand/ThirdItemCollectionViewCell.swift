//
//  ThirdItemCollectionViewCell.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/05/20.
//

import UIKit

class ThirdItemCollectionViewCell: UICollectionViewCell {

    static let identifier : String = "ThirdItemCollectionViewCell"

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemDesc: UILabel!
    
    @IBOutlet weak var discPercent: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var freeDeliv: UIButton!
    
    
    @IBOutlet weak var fastDeliv: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



    @IBAction func heartButtonClicked(_ sender: Any) {
        
        let blankHeart = UIImage(named:"icLike")
        
        
        if (heartButton.currentImage == blankHeart) {
        heartButton.setImage(UIImage(named: "icLikeClicked"), for: UIControl.State.normal)
        } else {
            heartButton.setImage(blankHeart, for: UIControl.State.normal)
        }

    }
    
func setData(name: String, itemDes: String, price: Int, discount : Bool, discountPrice: Int, percent: Int, itemImageName: String, freeDelivery: Bool, fastDelivery: Bool ) {
   
    //default setting
    itemName.text = name
    itemDesc.text = itemDes
    //heartButton.isHidden = false
    
    if let image = UIImage(named: itemImageName) {
        itemImage.image = image
    }
    
    //if item is not on discount
    if discount == false {
        discPercent.isHidden = true
        //discountView.isHidden = true
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




