//
//  Restaurant.swift
//  RxSwiftMVVM
//
//  Created by 정수현 on 2020/11/28.
//

import Foundation

struct Restaurant: Decodable {
    let name: String
    let cuisine: Cuisine
}

enum Cuisine: String, Decodable {
    case mexican
    case european
    case french
}
