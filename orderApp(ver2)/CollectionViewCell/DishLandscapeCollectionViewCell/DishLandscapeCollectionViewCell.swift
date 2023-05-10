//
//  DishLandscapeCollectionViewCell.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishLandscapeCollectionViewCell"

    
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishCaloriesLabel: UILabel!
    
    
    
    func setup(dish: Dish) {
        dishTitleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishDescriptionLabel.text = dish.description
        dishCaloriesLabel.text = dish.formattedCalories
    }

}
