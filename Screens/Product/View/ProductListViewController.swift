//
//  ProductListViewController.swift
//  Asnmt2
//
//  Created by Tapas Kumar Patra on 12/10/23.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableView : UITableView!
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}
extension ProductListViewController {
    func configuration(){
        productTableView.register(UINib(nibName: "ProductRow", bundle: nil),
                                  forCellReuseIdentifier:  "ProductRow")
        initViewModel()
        observeEvent()
    }
    func initViewModel(){
        viewModel.fetchProducts()
    }
    func observeEvent(){
        viewModel.eventHandler = {[weak self] event in
            guard let self else {return}
            switch event {
            case .loading :
                print("loading")
            case .stopLoading :
                print("stop loading")
            case .dataLoaded:
                print("data loaded")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
                
//                print(self.viewModel.products)
            case .error(let error):
                print(error as Any)
            }
        }
    }
}
extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductRow") as?
                    ProductRow else {
                return UITableViewCell()
            }
            let product = viewModel.products[indexPath.row]
            cell.product = product
            return cell
    }
}
