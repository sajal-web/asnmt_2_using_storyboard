//
//  ProductViewModel.swift
//  Asnmt2
//
//  Created by Tapas Kumar Patra on 12/10/23.
//

import Foundation
final class ProductViewModel{
    
    var products : [Product] = []
    var eventHandler : ((_ event : Event) -> Void)?
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        ApiManager.shared.fetchProducts{response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products) :
                print(products)
                self.products = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error) :
                print(error)
                self.eventHandler?(.error(error))
            }
        }
    }
}
extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
