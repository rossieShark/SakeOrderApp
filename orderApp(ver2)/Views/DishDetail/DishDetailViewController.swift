//
//  DishDetailViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit

class DishDetailViewController: UIViewController {

    @IBOutlet weak var dishImageView: UIImageView!
    @IBOutlet weak var dishTitleLabel: UILabel!
    @IBOutlet weak var dishCaloriesLabel: UILabel!
    @IBOutlet weak var dishDescriptionLabel: UILabel!
    @IBOutlet weak var dishTF: UITextField!
    @IBOutlet weak var dishButtonlabel: UIButton!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

        // Do any additional setup after loading the view.
    }
    
    private func populateView() {
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLabel.text = dish.name
        dishDescriptionLabel.text = dish.description
        dishCaloriesLabel.text = dish.formattedCalories
    }
    

    @IBAction func placeOrderButtonClicked(_ sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
