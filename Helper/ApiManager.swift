//
//  ApiManager.swift
//  Asnmt2
//
//  Created by Tapas Kumar Patra on 11/10/23.
//

//singeltone:
//        because of this static keyword we can access all function of this class using Apimanager().shared.temp() --> access using .
//        by using static, without creating any object of this class we can access
//       -> can  create any object outside of the class

// Singeltone
//        -> can't  create any object outside of the class


import UIKit
// Singleton design pattern

enum DataError : Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case message(_ error : Error?)
}
typealias Handlar = (Result<[Product],DataError>)->Void
final class ApiManager {
    static let shared = ApiManager()
    private init() {}
    func fetchProducts(completion : @escaping Handlar) {
        guard let url = URL(string: Constant.API.ProductURL) else {
            return
        }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Create a task that retrives the contents of the specific url, then calls a handalar upon completatoin
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do{
                let products = try JSONDecoder().decode([Product].self,
                                                        from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}
