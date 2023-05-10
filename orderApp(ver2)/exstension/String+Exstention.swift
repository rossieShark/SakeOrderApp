//
//  String+Exstention.swift
//  orderApp(ver2)
//
//  Created by Роза Шархмуллина on 10.05.23.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
