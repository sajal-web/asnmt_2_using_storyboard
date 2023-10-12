//
//  ProductRow.swift
//  Asnmt2
//
//  Created by Tapas Kumar Patra on 12/10/23.
//

import UIKit
import Kingfisher

class ProductRow: UITableViewCell {

    @IBOutlet weak var ProductBackgroundView: UIView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UIButton!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    var product : Product?{
        didSet{
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        ProductBackgroundView.clipsToBounds = false
        ProductBackgroundView.layer.cornerRadius = 15
        productImage.layer.cornerRadius = 15
        self.ProductBackgroundView.backgroundColor = .systemGray6
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func productDetailConfiguration(){
        guard let product else {return}
        productTitleLabel.text = product.title
        productCategoryLabel.text = product.category
        productDescriptionLabel.text = product.description
        productPriceLabel.text =  "$ \(product.price)"
        productRatingLabel.setTitle("\(product.rating.rate)",for: .normal)
        productImage.loadImage(with: product.image)
    }
}
