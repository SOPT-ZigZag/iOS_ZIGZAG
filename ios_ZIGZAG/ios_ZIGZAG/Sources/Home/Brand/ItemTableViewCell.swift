//
//  ItemTableViewCell.swift
//  ios_ZIGZAG
//
//  Created by kyoungjin on 2021/05/20.
//

import UIKit
import Alamofire

class ItemTableViewCell: UITableViewCell {

    static let identifier : String = "ItemTableViewCell"

    
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var discPercent: UILabel!
    @IBOutlet weak var discPrice: UILabel!
    @IBOutlet weak var discLabel: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var freeDeliv: UIImageView!
    @IBOutlet weak var fastDeliv: UIImageView!
    
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var basketButton: UIButton!
    
    
    
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
    @IBAction func basketButtonClicked(_ sender: Any) {
    

        let blankBasket = UIImage(named:"icShoppingBasket")
        
        if (basketButton.currentImage == blankBasket) {
        basketButton.setImage(UIImage(named: "icShoppingBasketClicked"), for: UIControl.State.normal)
        } else {
            basketButton.setImage(blankBasket
                                  , for: UIControl.State.normal)
        }
        
    
    
    }
    static func nib() -> UINib {
            return UINib(nibName: "ItemTableViewCell", bundle: nil)
        
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData (name: String, itemDes: String, price: Int, discount : Bool, discountPrice: Int, percent: Int, itemImageName: String, freeDelivery: Bool, fastDelivery: Bool ) {
       
        //default setting
        itemName.text = name
        itemDesc.text = itemDes
        
        if let image = UIImage(named: itemImageName) {
            itemImage.image = image
        }
        
        //서버에서 받은 이미지로 상품 보여주기
        /*let url = URL(string: itemImageName)
        
        do {
        let data = try Data(contentsOf: url!)
        itemImage.image = UIImage(data: data)
            
        }
        catch {
            print(error.localizedDescription)
        }*/
        
    
        //if item is not on discount
        if discount == false {
            discLabel.isHidden = true
            discPercent.isHidden = true
            //set price to the original price
            itemPrice.text = String(price)
        } else {
            itemPrice.text = String(price)
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
