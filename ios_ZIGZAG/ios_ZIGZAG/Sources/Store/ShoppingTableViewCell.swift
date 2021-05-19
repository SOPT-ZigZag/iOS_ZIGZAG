//
//  ShoppingTableViewCell.swift
//  ios_ZIGZAG
//
//  Created by 민 on 2021/05/18.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var firstShopLabel: UILabel!
    @IBOutlet weak var secondShopLabel: UILabel!
    @IBOutlet weak var dcLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var likePersonLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "ShoppingTableViewCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
