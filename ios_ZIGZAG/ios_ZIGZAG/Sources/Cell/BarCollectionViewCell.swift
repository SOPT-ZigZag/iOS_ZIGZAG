//
//  BarCollectionViewCell.swift
//  ios_ZIGZAG
//
//  Created by Yi Joon Choi on 2021/05/17.
//

import UIKit

class BarCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        label.textColor = .lightGray
    }
    
    override var isHighlighted: Bool{
        didSet{
            label.textColor = isHighlighted ? .grayScaleDarkGray02 : .lightGray
        }
    }
    
    override var isSelected: Bool{
        didSet{
            label.textColor = isSelected ? .grayScaleDarkGray02 : .lightGray
        }
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "BarCollectionViewCell", bundle: nil)
    }

}
