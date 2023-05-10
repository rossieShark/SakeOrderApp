//
//  Dish.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import Foundation

struct Dish {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Double?
    
    var formattedCalories: String {
        return String(format: "%.0f", calories ?? 0) + " calories"
    }
    
}
