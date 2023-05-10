//
//  CategoryCollectionViewCell.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: CategoryCollectionViewCell.self)


    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLable: UILabel!
    
    
    func setup(category: DishCategory) {
        categoryTitleLable.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asURL)
    }
}
