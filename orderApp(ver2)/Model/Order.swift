//
//  Orders.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import Foundation

struct Order {
    let id: String?
    let quantityOfCultery: Int?
    let dish: Dish?
    
    var formattetQuantityOfCultery: String {
        return String(quantityOfCultery ?? 0)
    }
}
