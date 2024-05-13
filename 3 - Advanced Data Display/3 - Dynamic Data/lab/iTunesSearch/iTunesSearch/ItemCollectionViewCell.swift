//
//  ItemCollectionViewCell.swift
//  iTunesSearch
//
//  Created by Jordan Fraughton on 5/7/24.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell, ItemDisplaying {
    static let placeholder = UIImage(systemName: "photo")!
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
}
