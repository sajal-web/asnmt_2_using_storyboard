//
//  Product.swift
//  Asnmt2
//
//  Created by Tapas Kumar Patra on 12/10/23.
//

import Foundation
struct Product : Decodable {
    let id : Int
    let title : String
    let price : Float
    let description : String
    let category : String
    let image : String
    let rating : Rate // Because rating is a distionary if this rating would be an array then we write it like ->  [Rate]
}
struct Rate : Decodable{
    let rate : Float
    let count : Int
}
