//
//  ListOrdersViewController.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var orders: [Order] = [
        .init(id: "01", quantityOfCultery: 3, dish: .init(id: "03", name: "Pizza", description: "The best Sushi I have ever tasted", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 234.244444)),
        .init(id: "02", quantityOfCultery: 3 ,dish: .init(id: "04", name: "Sushi", description: "The best Sushi I have ever tasted", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 234.244444)),
        .init(id: "02", quantityOfCultery: 3, dish: .init(id: "05", name: "Sake", description: "The best Sushi I have ever tasted", image: "https://images.squarespace-cdn.com/content/5f329f79c232cb4ecb69ba9a/1611677176317-X1GABBB9IZT6D994NAZE/flying-sushi-cape-town-food-photographer-carla-mcmahon-2.jpg?format=1500w&content-type=image%2Fjpeg", calories: 234.244444))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Orders"
        registerCells()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }

}


extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    
    
    
}
