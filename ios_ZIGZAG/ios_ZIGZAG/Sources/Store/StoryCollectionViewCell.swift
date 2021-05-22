//
//  StoryCollectionViewCell.swift
//  ios_ZIGZAG
//
//  Created by 민 on 2021/05/18.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "StoryCollectionViewCell"
    
    @IBOutlet weak var storyImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "StoryCollectionViewCell", bundle: nil)
    }
}
