//
//  OrderFoodViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit

class OrderFoodViewController: UIViewController {
    

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var chefsSpesialsCollectionView: UICollectionView!
    @IBOutlet weak var popularDishesCollectionView: UICollectionView!
    var categories: [DishCategory] = [
        .init(id: "01", name: "Sushi", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg"),
        .init(id: "02", name: "Sushi 2", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg"),
        .init(id: "03", name: "Set", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg"),
        .init(id: "04", name: "Sushi 4", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg"),
        .init(id: "05", name: "Sushi 5", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg")]
    
    var popularDishes: [Dish] = [
        .init(id: "01", name: "Sushi1", description: "The best Sushi I have ever tasted.", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 320.24),
        .init(id: "02", name: "Sushi2", description: "The best Sushi I have ever tasted", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 32.2422),
        .init(id: "03", name: "Sushi3", description: "The best Sushi I have ever tasted", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 234.244444)
    ]
    
    var chefsSpetials: [Dish] = [
        .init(id: "01", name: "Pizza", description: "This is my favorite", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 234.244444),
        .init(id: "02", name: "Sake", description: "The best Sake I've ever drinked", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 10)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()

        // Do any additional setup after loading the view.
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularDishesCollectionView.register(UINib(nibName: DishTypeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishTypeCollectionViewCell.identifier)
        chefsSpesialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
        
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

extension OrderFoodViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularDishesCollectionView:
            return popularDishes.count
        case chefsSpesialsCollectionView:
            return chefsSpetials.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularDishesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishTypeCollectionViewCell.identifier, for: indexPath) as! DishTypeCollectionViewCell
             cell.setup(dish: popularDishes[indexPath.row])
            return cell
        case chefsSpesialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
             cell.setup(dish: chefsSpetials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularDishesCollectionView ? popularDishes[indexPath.row] : chefsSpetials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
            
        }
    }
}
