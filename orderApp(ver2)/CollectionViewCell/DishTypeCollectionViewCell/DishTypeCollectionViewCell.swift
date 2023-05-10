//
//  DishTypeCollectionViewCell.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit

class DishTypeCollectionViewCell: UICollectionViewCell {
    static let identifier = "DishTypeCollectionViewCell"

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setup(dish: Dish) {
        titleLabel.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asURL)
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
    }
}
