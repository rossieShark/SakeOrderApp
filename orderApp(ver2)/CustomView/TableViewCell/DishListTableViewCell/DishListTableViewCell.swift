//
//  DishListTableViewCell.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit

class DishListTableViewCell: UITableViewCell {
    static let identifier = "DishListTableViewCell"

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setup(dish: Dish) {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLabel.text = dish.name
        descriptionLabel.text = dish.description
    }
    func setup(order: Order) {
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        dishTitleLabel.text = order.dish?.name
        descriptionLabel.text = order.formattetQuantityOfCultery
    }
}
