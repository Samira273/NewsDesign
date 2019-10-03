//
//  MyCollectionViewCell.swift
//  NewsDesign
//
//  Created by Samira.Marassy on 10/3/19.
//  Copyright © 2019 Samira.Marassy. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellIndex: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
